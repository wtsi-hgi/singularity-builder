# Singularity Builder

A simple Docker container that contains Singularity; mostly for building
images. Use the wrapper script, which bind mounts the `images`,
`recipes` and `cache` directories into the container root, and invokes
Singularity with the options you give it. For example:

    singularity.sh build ubuntu.simg docker://ubuntu

## Alternative Versions

You may specify a specific version of the `mercury/singularity-builder`
image on Docker Hub by setting the `VERSION` environment variable. For
example:

    VERSION=2.5.2 ./singularity.sh [etc.]

To use an alternative image entirely (say, one on your local system),
you can set the `BUILDER_IMAGE` environment variable:

    BUILDER_IMAGE=my-singularity:latest ./singularity.sh [etc.]
