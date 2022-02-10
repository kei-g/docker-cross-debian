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
RUN mkdir /pkg \
  && curl -Lk https://github.com/freebsd/pkg/archive/refs/tags/1.17.5.tar.gz \
    | bsdtar -C /pkg -xzf - \
  && cd /pkg/pkg-1.17.5 \
  && { \
    ./configure --with-libarchive.pc \
    && { \
      make -j8 || make -V=1; \
      make install; \
    }; \
  } \
  && rm -fr /pkg /usr/local/sbin/pkg2ng

# Download FreeBSD base
RUN for arch in amd64 arm64 armv6 armv7 i386; do \
    mkdir -p /fbsd/13.0/$arch; \
  done \
  && curl -k https://download.freebsd.org/ftp/releases/amd64/amd64/13.0-RELEASE/base.txz \
    | bsdtar -C /fbsd/13.0/amd64 -Jxf - ./etc ./lib ./usr/include ./usr/lib ./usr/libdata ./usr/share/keys \
  && ln -fs /fbsd/13.0/amd64/usr/share/keys /usr/share/keys \
  && curl -k https://download.freebsd.org/ftp/releases/arm64/aarch64/13.0-RELEASE/base.txz \
    | bsdtar -C /fbsd/13.0/arm64 -Jxf - ./etc ./lib ./usr/include ./usr/lib ./usr/libdata ./usr/share/keys \
  && curl -k https://download.freebsd.org/ftp/releases/i386/i386/13.0-RELEASE/base.txz \
    | bsdtar -C /fbsd/13.0/i386 -Jxf - ./etc ./lib ./usr/include ./usr/lib ./usr/libdata ./usr/share/keys

# Setup `pkg` configurations
COPY fbsd /fbsd

# Update indices of `pkg`
RUN pkg -r /fbsd/13.0/amd64 update \
  && pkg -r /fbsd/13.0/arm64 update \
  && pkg -r /fbsd/13.0/armv6 update \
  && pkg -r /fbsd/13.0/armv7 update \
  && pkg -r /fbsd/13.0/i386 update

# Setup `meson` configurations
COPY local /usr/local

# Prepend ~/.local/bin to PATH
ENV PATH ~/.local/bin:$PATH
