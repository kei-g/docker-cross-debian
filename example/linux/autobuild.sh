#!/bin/sh
for arg in aarch64:gnu arm:gnueabihf i686:gnu x86_64:gnu; do
  arch=$(echo $arg | cut -d':' -f1)
  abi=$(echo $arg | cut -d':' -f2)
  clang \
    --target=$arch-pc-linux-$abi \
    -Oz \
    -Wall \
    -Werror \
    -Wextra \
    -Wl,-s \
    -flto \
    -fno-plt \
    -fuse-ld=lld \
    -o foo-$arch \
    -pedantic \
    ../src/foo.c \
  || true
done
tar -cf - foo-aarch64 foo-arm foo-i686 foo-x86_64
