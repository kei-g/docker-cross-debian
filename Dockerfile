FROM debian:stable-slim

ENV DEBCONF_NOWARNINGS=yes
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture amd64
RUN dpkg --add-architecture arm64
RUN dpkg --add-architecture armhf
RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get dist-upgrade -y
RUN apt-get install -y gnupg
RUN apt-get install -y lsb-release
RUN apt-get install -y software-properties-common
RUN apt-get install -y wget
RUN wget -O - https://apt.llvm.org/llvm.sh | bash -s

RUN apt-get install -y automake
RUN apt-get install -y g++-aarch64-linux-gnu
RUN apt-get install -y g++-arm-linux-gnueabihf
RUN apt-get install -y g++-i686-linux-gnu
RUN apt-get install -y g++-mingw-w64-i686
RUN apt-get install -y g++-mingw-w64-x86-64
RUN apt-get install -y gcc-aarch64-linux-gnu
RUN apt-get install -y gcc-arm-linux-gnueabihf
RUN apt-get install -y gcc-i686-linux-gnu
RUN apt-get install -y gcc-mingw-w64-i686
RUN apt-get install -y gcc-mingw-w64-x86-64
RUN apt-get install -y libc++-13-dev
RUN apt-get install -y libc++abi-13-dev
RUN apt-get install -y libc6-dev-amd64-cross
RUN apt-get install -y libunwind-13-dev
RUN apt-get install -y make
