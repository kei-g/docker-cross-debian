#!/bin/sh
set -e
llvmdir=$(find /usr/lib -maxdepth 1 -name llvm-\* -type d -exec stat -c '%X %n' {} \; \
	| sort -nr \
	| awk 'NR==1,NR==3 {print $2}' \
	| head -n1)
PATH=$llvmdir/bin:$PATH
for arch in amd64 arm64 armv6 armv7 i386; do
	CC_LD=lld \
	LDFLAGS=-fuse-ld=lld \
	meson \
		setup \
		--backend=ninja \
		--buildtype=release \
		--cross-file=$arch-fbsd13 \
		$arch
	ninja -C $arch -v
	mv $arch/foo foo-$arch
done
