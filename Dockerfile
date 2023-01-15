FROM snowstep/llvm

# Install dependent packages
RUN DEBIAN_FRONTEND=noninteractive \
  && apt-fast update \
  && apt-fast upgrade --no-install-recommends -yqq \
  && apt-fast install -y \
    automake \
    build-essential \
    bzip2 \
    gcc-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    gcc-i686-linux-gnu \
    gcc-mingw-w64-i686 \
    gcc-mingw-w64-x86-64 \
    libacl1-dev \
    libarchive-dev \
    libarchive-tools \
    libattr1-dev \
    libbsd-dev \
    libbz2-dev \
    libc6-dev-amd64-cross \
    libexpat1-dev \
    liblua5.2-dev \
    liblz4-dev \
    liblzma-dev \
    liblzo2-dev \
    libsqlite3-dev \
    libssl-dev \
    libxml2-dev \
    libzstd-dev \
    m4 \
    make \
    mingw-w64-tools \
    nettle-dev \
    python3 \
    python3-pip \
    zlib1g-dev \
  && apt-get -y clean \
  && rm -fr /var/lib/apt/lists/* \
  && python3 -m pip install --upgrade pip \
  && python3 -m pip install meson ninja \
  && python3 -m pip cache purge

# Make a link for FreeBSD
RUN ln -s libstdc++.so.6 /usr/lib/libstdc++.so

# Install `pkg` on Linux to download dependencies into the FreeBSD root
ARG PKG_VER=1.18.4
RUN mkdir /pkg \
  && aria2c --dir=/pkg https://github.com/freebsd/pkg/archive/refs/tags/${PKG_VER}.tar.gz \
  && bsdtar -C /pkg -xz -f /pkg/pkg-${PKG_VER}.tar.gz \
  && { \
    cd /pkg/pkg-${PKG_VER} \
    && ./configure --with-libarchive.pc \
    && { \
      make -j $(nproc) || make -V=1; \
      make install; \
    }; \
  } \
  && rm -fr /pkg /usr/local/sbin/pkg2ng

# Download FreeBSD base
ARG FREEBSD_VERSION=13.0
RUN for arg in amd64:amd64/amd64 arm64:arm64/aarch64 i386:i386/i386; do \
    arch=$(echo $arg | cut -d':' -f1) \
    && dir=$(echo $arg | cut -d':' -f2) \
    && mkdir -pv /fbsd/${FREEBSD_VERSION}/$arch \
    && aria2c --dir=/tmp \
      https://download.freebsd.org/ftp/releases/$dir/${FREEBSD_VERSION}-RELEASE/base.txz \
    && bsdtar \
      -C /fbsd/${FREEBSD_VERSION}/$arch \
      -Jvxf /tmp/base.txz \
      ./etc \
      ./lib \
      ./usr/include \
      ./usr/lib \
      ./usr/libdata \
      ./usr/share/keys \
    && rm -f /tmp/base.txz; \
  done

# Setup `pkg` configurations
COPY fbsd /fbsd

# Update indices of `pkg`
RUN for arch in amd64 arm64 armv6 armv7 i386; do \
    printf 'updating indices of pkg on %s\n' $arch >&2; \
    pkg -r /fbsd/${FREEBSD_VERSION}/$arch update; \
  done

# Setup `meson` configurations
COPY local /usr/local

# Prepend ~/.local/bin to PATH
ENV PATH ~/.local/bin:$PATH
