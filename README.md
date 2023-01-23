[![GitHub][github-repo-image]][github-repo-url] [![DockerHub][docker-image]][docker-url]

# docker-cross-debian [![license][license-image]][license-url]

[`docker-cross-debian`][github-repo-url] - Cross compile environment on Debian.

This image depends on [![`docker-llvm`][docker-llvm-image]][docker-llvm-url]

# Usage

```shell
docker pull snowstep/cross-debian:latest
```

# Supported Architectures

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

# CI Status

| Workflow Name | Status |
|-|-|
| **Example** | [![GitHub CI (Example)][github-example-image]][github-example-url] |
| **Publish** | [![GitHub CI (Publish)][github-publish-image]][github-publish-url] |

# License

The scripts and documentation in this project are released under the [BSD-3-Clause License][license-url]

# Contributions

Contributions are welcome! See [Contributor's Guide](https://github.com/kei-g/docker-cross-debian/blob/main/CONTRIBUTING.md)

# Code of Conduct

:clap: Be nice. See [our code of conduct](https://github.com/kei-g/docker-cross-debian/blob/main/CODE_OF_CONDUCT.md)

[docker-image]:https://img.shields.io/docker/v/snowstep/cross-debian?logo=docker
[docker-llvm-image]:https://img.shields.io/docker/v/snowstep/llvm?label=snowstep%2Fllvm&logo=docker
[docker-llvm-url]:https://hub.docker.com/r/snowstep/llvm
[docker-url]:https://hub.docker.com/r/snowstep/cross-debian
[github-example-image]:https://github.com/kei-g/docker-cross-debian/actions/workflows/example.yml/badge.svg
[github-example-url]:https://github.com/kei-g/docker-cross-debian/actions/workflows/example.yml
[github-publish-image]:https://github.com/kei-g/docker-cross-debian/actions/workflows/publish.yml/badge.svg
[github-publish-url]:https://github.com/kei-g/docker-cross-debian/actions/workflows/publish.yml
[github-repo-image]:https://img.shields.io/badge/github-kei--g%2Fdocker--cross--debian-brightgreen?logo=github
[github-repo-url]:https://github.com/kei-g/docker-cross-debian
[license-image]:https://img.shields.io/github/license/kei-g/docker-cross-debian
[license-url]:https://github.com/kei-g/docker-cross-debian/blob/main/LICENSE
