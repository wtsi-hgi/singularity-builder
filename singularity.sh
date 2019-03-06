#!/usr/bin/env bash
docker run --privileged -it \
           -v $(pwd)/images:/images -v $(pwd)/recipes:/recipes \
           "${BUILDER_IMAGE-mercury/singularity-builder:latest}" \
           singularity "$@"
