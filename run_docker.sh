#!/bin/bash -e
# Run docker image

docker run --rm -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -u root --privileged -v /dev:/dev -v `readlink -f .`:/opt/workspace -v ~/.ssh:/home/builder/.ssh ice40env bash -c "usermod -u `id -u` builder && groupmod -g `id -g` builder && bash -c 'su -c \"export PATH=\$PATH && bash\" builder'"
