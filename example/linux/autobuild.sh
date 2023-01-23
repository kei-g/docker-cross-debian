#!/bin/sh
set -e
for arg in aarch64:gnu arm:gnueabihf i686:gnu x86_64:gnu; do
	arch=${arg%:*}
	abi=${arg#*:}
	clang \
		--target=$arch-pc-linux-$abi \
		-O2 \
		-Wall \
		-Werror \
		-Wextra \
		-Wl,-s \
		-flto \
		-fno-plt \
		-fuse-ld=lld \
		-o foo-$arch \
		-pedantic \
		../src/foo.c
done
