# docker-cross-debian [![license][license-image]][license-url] [![docker][docker-image]][docker-url]

[![GitHub CI (Build)][github-build-image]][github-build-url]

`docker-cross-debian` - Cross compile environment on Debian

## How to use

```shell
docker pull snowstep/cross-debian:latest
```

## Architectures

- FreeBSD 13.0
  - amd64
  - arm64
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

[docker-image]:https://img.shields.io/docker/v/snowstep/cross-debian?logo=docker
[docker-url]:https://hub.docker.com/r/snowstep/cross-debian
[github-build-image]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml/badge.svg
[github-build-url]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml
[license-image]:https://img.shields.io/github/license/kei-g/docker-cross-debian
[license-url]:https://github.com/kei-g/docker-cross-debian/blob/main/LICENSE
