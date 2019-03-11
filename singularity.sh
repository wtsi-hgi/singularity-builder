#!/usr/bin/env bash

declare VERSION="${VERSION-latest}"
declare DEFAULT_IMAGE="mercury/singularity-builder:${VERSION}"
declare BUILDER_IMAGE="${BUILDER_IMAGE-${DEFAULT_IMAGE}}"

docker run --privileged -it \
           -v $(pwd)/images:/images \
           -v $(pwd)/recipes:/recipes \
           -v $(pwd)/cache:/cache \
           "${BUILDER_IMAGE}" \
           singularity "$@"
