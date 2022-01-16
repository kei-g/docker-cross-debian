FROM debian:stable-slim

ENV DEBCONF_NOWARNINGS=yes
ENV DEBIAN_FRONTEND=noninteractive

# Add architectures
RUN dpkg --add-architecture amd64
RUN dpkg --add-architecture arm64
RUN dpkg --add-architecture armhf
RUN dpkg --add-architecture i386

# Install `apt-fast`
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y sudo
RUN apt-get install -y wget
RUN wget -O - https://git.io/vokNn | bash -s
RUN echo debconf apt-fast/aptmanager string apt | debconf-set-selections

# Install LLVM
RUN apt-fast install -y gnupg
RUN apt-fast install -y lsb-release
RUN apt-fast install -y software-properties-common
RUN alias apt-get=apt-fast && wget -O - https://apt.llvm.org/llvm.sh | bash -s
RUN cd /usr/bin && for name in $(ls clang*-13 ll*-13); do ln -s $name $(echo $name | sed -e 's/\-13//'); done

# Install dependent packages
RUN apt-fast install -y automake
RUN apt-fast install -y g++-aarch64-linux-gnu
RUN apt-fast install -y g++-arm-linux-gnueabihf
RUN apt-fast install -y g++-i686-linux-gnu
RUN apt-fast install -y g++-mingw-w64-i686
RUN apt-fast install -y g++-mingw-w64-x86-64
RUN apt-fast install -y gcc-aarch64-linux-gnu
RUN apt-fast install -y gcc-arm-linux-gnueabihf
RUN apt-fast install -y gcc-i686-linux-gnu
RUN apt-fast install -y gcc-mingw-w64-i686
RUN apt-fast install -y gcc-mingw-w64-x86-64
RUN apt-fast install -y libc++-13-dev
RUN apt-fast install -y libc++abi-13-dev
RUN apt-fast install -y libc6-dev-amd64-cross
RUN apt-fast install -y libunwind-13-dev
RUN apt-fast install -y make
