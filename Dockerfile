FROM debian:13-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    clang-format \
    curl \
    diffutils \
    dos2unix \
    doxygen \
    git \
    jq \
    libhidapi-hidraw0 \
    python3 \
    python3-pip \
    rsync \
    sudo \
    tar \
    unzip \
    util-linux \
    wget \
    zip \
    zstd \
&& rm -rf /var/lib/apt/lists/*
