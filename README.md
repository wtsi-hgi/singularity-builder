# Singularity Builder

A simple Docker container that contains Singularity; mostly for building
images. Use the wrapper script, which bind mounts the `images` and
`recipes` directories into the container root, and invokes Singularity
with the options you give it. For example:

    singularity.sh build ubuntu.simg docker://ubuntu
