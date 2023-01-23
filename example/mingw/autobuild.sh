#!/bin/sh
set -e
for arch in i686 x86_64; do
	clang \
		--target=$arch-w64-mingw32 \
		-L /usr/lib/gcc/$arch-w64-mingw32/10-win32 \
		-O2 \
		-Wall \
		-Werror \
		-Wextra \
		-Wl,-s \
		-flto \
		-fuse-ld=lld \
		-o foo-$arch.exe \
		-pedantic \
		../src/foo.c
done
