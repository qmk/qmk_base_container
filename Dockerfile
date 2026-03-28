FROM debian:13-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    ccache \
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

RUN mkdir -p -m 755 /etc/apt/keyrings \
&& wget -nv https://cli.github.com/packages/githubcli-archive-keyring.gpg -O /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& mkdir -p -m 755 /etc/apt/sources.list.d \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" > /etc/apt/sources.list.d/github-cli.list \
&& apt-get update && apt-get install -y \
    gh \
&& rm -rf /var/lib/apt/lists/*
