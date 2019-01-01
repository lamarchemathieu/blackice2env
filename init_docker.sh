#!/bin/bash -e
# Generate docker image

docker build -t ice40env --rm=true `dirname $0`/docker/
