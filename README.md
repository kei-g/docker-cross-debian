# docker-cross-debian [![github][github-repo-image]][github-repo-url] [![license][license-image]][license-url] [![docker][docker-image]][docker-url]

`docker-cross-debian` - Cross compile environment on Debian

This image depends on [![`docker-llvm`][docker-llvm-image]][docker-llvm-url]

## How to use

```shell
docker pull snowstep/cross-debian:latest
```

## Architectures

- FreeBSD 13.0
  - amd64
  - arm64
  - armv6
  - armv7
  - i386
- linux
  - amd64
  - arm64
  - armhf
  - i386
- mingw
  - w64
    - amd64
    - i386

## CI Status

[![GitHub CI (Build)][github-build-image]][github-build-url]

[docker-image]:https://img.shields.io/docker/v/snowstep/cross-debian?logo=docker
[docker-llvm-image]:https://img.shields.io/docker/v/snowstep/llvm?label=snowstep%2Fdocker-llvm&logo=docker
[docker-llvm-url]:https://hub.docker.com/r/snowstep/llvm
[docker-url]:https://hub.docker.com/r/snowstep/cross-debian
[github-build-image]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml/badge.svg
[github-build-url]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml
[github-repo-image]:https://img.shields.io/badge/github-kei--g%2Fdocker--cross--debian-brightgreen?logo=github
[github-repo-url]:https://github.com/kei-g/docker-cross-debian
[license-image]:https://img.shields.io/github/license/kei-g/docker-cross-debian
[license-url]:https://github.com/kei-g/docker-cross-debian/blob/main/LICENSE
