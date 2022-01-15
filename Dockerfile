FROM debian:stable-slim

ENV DEBCONF_NOWARNINGS=yes
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture amd64 && \
  dpkg --add-architecture arm64 && \
  dpkg --add-architecture armhf && \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get upgrade -y && \
  apt-get dist-upgrade -y && \
  apt-get install -y clang gnupg lld llvm wget && \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | \
    apt-key add -

COPY etc/ /etc/

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get dist-upgrade -y && \
  apt-get install -y \
    automake \
    clang-13 \
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
    lld-13 \
    llvm-13 \
    make

ENV PATH=/usr/lib/llvm-13/bin:$PATH
