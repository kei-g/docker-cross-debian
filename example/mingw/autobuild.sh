#!/bin/sh
for arch in i686 x86_64; do
  PATH=/usr/lib/llvm-14/bin:$PATH \
  clang \
    --target=$arch-w64-mingw32 \
    -L /usr/lib/gcc/$arch-w64-mingw32/10-win32 \
    -Oz \
    -Wall \
    -Werror \
    -Wextra \
    -Wl,-s \
    -flto \
    -fuse-ld=lld \
    -o foo-$arch.exe \
    -pedantic \
    ../src/foo.c \
  || true
done
tar -cf - foo-i686.exe foo-x86_64.exe
