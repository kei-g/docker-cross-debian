#!/bin/sh
set -e
for arch in amd64 arm64 armv6 armv7 i386; do
	CC_LD=lld \
	LDFLAGS=-fuse-ld=lld \
	meson \
		--backend=ninja \
		--buildtype=release \
		--cross-file=$arch-fbsd13 \
		$arch
	ninja -C $arch -v
	mv $arch/foo foo-$arch
done >&2
tar -cf - foo-*
