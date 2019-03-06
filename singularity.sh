#!/usr/bin/env bash
docker run --privileged -it \
           -v $(pwd)/images:/images -v $(pwd)/recipes:/recipes \
           mercury/singularity-builder \
           singularity "$@"
