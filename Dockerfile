FROM ubuntu:latest

# Install apt packages
RUN export DEBIAN_FRONTEND=noninteractive \
 && apt update \
 && apt install -y build-essential \
                   libseccomp-dev \
                   pkg-config \
                   squashfs-tools \
                   cryptsetup \
                   git \
                   curl \
                   debootstrap

# Install Go, clone Singularity and build
RUN curl -L https://dl.google.com/go/go1.13.15.linux-amd64.tar.gz \
  | tar xzC /usr/local \
 && export GOPATH=${HOME}/go \
 && export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin \
 && mkdir -p ${GOPATH}/src/github.com/sylabs \
 && cd ${GOPATH}/src/github.com/sylabs \
 && git clone https://github.com/sylabs/singularity.git \
 && cd singularity \
 && git checkout v3.6.4 \
 && ./mconfig \
 && cd ./builddir \
 && make \
 && make install

VOLUME /cache
VOLUME /images
VOLUME /recipes

ENV SINGULARITY_CACHEDIR /cache
WORKDIR /images

CMD /bin/bash
