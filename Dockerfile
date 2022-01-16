FROM debian:stable-slim

ENV DEBCONF_NOWARNINGS=yes
ENV DEBIAN_FRONTEND=noninteractive

# Add architectures
RUN for arch in amd64 arm64 armhf i386; do \
    dpkg --add-architecture $arch; \
  done

# Install `apt-fast`
RUN apt-get update \
  && apt-get upgrade -y \
  && apt-get install --no-install-recommends -y \
    sudo \
    wget \
  && wget -O - https://git.io/vokNn \
  | bash -s \
  && echo debconf apt-fast/aptmanager string apt \
  | debconf-set-selections

# Install LLVM
RUN apt-fast install -y \
    gnupg \
    lsb-release \
    software-properties-common \
  && alias apt-get=apt-fast \
  && wget -O - https://apt.llvm.org/llvm.sh \
  | bash -s \
  && cd /usr/bin \
  && for name in $(ls clang*-13 ll*-13); do \
    ln -s $name $(echo $name | sed -e 's/\-13//'); \
  done

# Install dependent packages
RUN apt-fast install -y \
    automake \
    g++-aarch64-linux-gnu \
    g++-arm-linux-gnueabihf \
    g++-i686-linux-gnu \
    g++-mingw-w64-i686 \
    g++-mingw-w64-x86-64 \
    gcc-aarch64-linux-gnu \
    gcc-arm-linux-gnueabihf \
    gcc-i686-linux-gnu \
    gcc-mingw-w64-i686 \
    gcc-mingw-w64-x86-64 \
    libc++-13-dev \
    libc++abi-13-dev \
    libc6-dev-amd64-cross \
    libunwind-13-dev \
    make
