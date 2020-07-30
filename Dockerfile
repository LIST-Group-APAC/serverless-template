FROM ubuntu:20.04

ARG NODE_VERSION
ARG YARN_VERSION

USER root

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
  wget \
  xz-utils \
  git \
  curl \
  gcc \
  g++ \
  make \
  build-essential \
  libpthread-stubs0-dev \
  liblz4-dev \
  libz-dev \
  libssl-dev \
  libsasl2-dev \
  libzstd-dev \
  python3-minimal \
  bash

RUN apt-get autoremove --purge -y

RUN mkdir -p /var/tmp

# install yarnpkg
RUN wget https://github.com/yarnpkg/yarn/releases/download/${YARN_VERSION}/yarn-${YARN_VERSION}.tar.gz -O /var/tmp/yarn.tar.gz
RUN tar xf /var/tmp/yarn.tar.gz --strip 1 -C /usr
RUN rm -f /var/tmp/yarn.tar.gz

# install nodejs
RUN wget https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.xz -O /var/tmp/node.tar.xz
RUN tar xf /var/tmp/node.tar.xz --strip 1 -C /usr
RUN rm -f /var/tmp/node.tar.xz

# install serverless
RUN curl -o- -L https://slss.io/install | bash
