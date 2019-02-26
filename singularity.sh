#!/usr/bin/env bash
docker run -itv $(pwd)/images:/images mercury/singularity-builder singularity "$@"
