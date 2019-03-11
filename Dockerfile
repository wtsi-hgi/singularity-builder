FROM ubuntu:latest

RUN apt update \
 && apt install -y build-essential \
                   golang \
                   libssl-dev \
                   uuid-dev \
                   libgpgme11-dev \
                   libseccomp-dev \
                   pkg-config \
                   squashfs-tools \
                   curl \
 && mkdir -p /src/github.com/sylabs \
 && cd /src/github.com/sylabs \
 && curl -L https://github.com/sylabs/singularity/releases/download/v3.1.0/singularity-3.1.0.tar.gz | tar xz \
 && cd singularity \
 && export GOPATH="/" \
 && ./mconfig \
 && cd builddir \
 && make \
 && make install \
 && rm -rf /src /var/lib/apt/lists/*

VOLUME /cache
VOLUME /images
VOLUME /recipes

ENV SINGULARITY_CACHEDIR /cache
WORKDIR /images

CMD /bin/bash
