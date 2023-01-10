# docker-cross-debian [![github][github-repo-image]][github-repo-url] [![license][license-image]][license-url] [![docker][docker-image]][docker-url]

`docker-cross-debian` - Cross compile environment on Debian

## How to use

```shell
docker pull snowstep/cross-debian:latest
```

## Architectures

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
[docker-url]:https://hub.docker.com/r/snowstep/cross-debian
[github-build-image]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml/badge.svg
[github-build-url]:https://github.com/kei-g/docker-cross-debian/actions/workflows/build.yml
[github-repo-image]:https://img.shields.io/badge/github-kei--g%2Fdocker--cross--debian-brightgreen?logo=github
[github-repo-url]:https://github.com/kei-g/docker-cross-debian
[license-image]:https://img.shields.io/github/license/kei-g/docker-cross-debian
[license-url]:https://github.com/kei-g/docker-cross-debian/blob/main/LICENSE
