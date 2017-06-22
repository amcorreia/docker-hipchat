#amcorreia/docker-hipchat
==================

[![Docker Stars](https://img.shields.io/docker/stars/amcorreia/docker-hipchat.svg)](https://hub.docker.com/r/amcorreia/docker-hipchat/)
[![Docker Pulls](https://img.shields.io/docker/pulls/amcorreia/docker-hipchat.svg)](https://hub.docker.com/r/amcorreia/docker-hipchat/)
[![Docker Build](https://img.shields.io/docker/automated/amcorreia/docker-hipchat.svg)](https://hub.docker.com/r/amcorreia/docker-hipchat/)
[![Layers](https://images.microbadger.com/badges/image/amcorreia/docker-hipchat.svg)](https://microbadger.com/images/amcorreia/docker-hipchat)
[![Version](https://images.microbadger.com/badges/version/amcorreia/docker-hipchat.svg)](https://microbadger.com/images/amcorreia/docker-hipchat)


Docker container image with [Hipchat](https://www.hipchat.com/).


### How to run

```sh
$ docker run --rm -it -v /tmp/.X11-unix:/tmp/.X11-unix --device /dev/video0 -e DISPLAY=unix$DISPLAY --name hipchat amcorreia/docker-hipchat
```

### How to build

```sh
$ docker build --no-cache --rm  -t amcorreia/docker-hipchat .
```
