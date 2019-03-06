FROM ubuntu:latest

RUN apt update \
 && apt install -y build-essential \
                   golang \
                   python \
                   libssl-dev \
                   uuid-dev \
                   libgpgme11-dev \
                   libseccomp-dev \
                   libarchive-dev \
                   pkg-config \
                   squashfs-tools \
                   curl \
 && curl -L https://github.com/sylabs/singularity/releases/download/2.5.2/singularity-2.5.2.tar.gz | tar xz \
 && cd singularity-2.5.2 \
 && ./configure --prefix=/usr/local \
 && make \
 && make install \
 && rm -rf /singularity-2.5.2 /var/lib/apt/lists/*

VOLUME /images
VOLUME /recipes
WORKDIR /images

CMD /bin/bash
