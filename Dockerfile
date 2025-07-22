FROM debian:12-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    ca-certificates \
    clang-format \
    curl \
    diffutils \
    dos2unix \
    git \
    jq \
    libhidapi-hidraw0 \
    python3 \
    python3-pip \
    software-properties-common \
    sudo \
    tar \
    unzip \
    util-linux \
    wget \
    zip \
    zstd \
&& rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 qmk \
&& useradd --uid 1000 --gid qmk --shell /bin/bash --create-home qmk \
&& echo "qmk ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/00-qmk \
&& chmod 0440 /etc/sudoers.d/00-qmk \
&& mkdir -p /home/qmk/.local/bin \
&& chown -R qmk:qmk /home/qmk \
&& mkdir /qmk_firmware \
&& mkdir /qmk_userspace \
&& chown -R qmk:qmk /qmk_firmware \
&& chown -R qmk:qmk /qmk_userspace

USER 1000:1000
WORKDIR /qmk_firmware

ENV QMK_FIRMWARE=/qmk_firmware \
    QMK_HOME=/qmk_firmware \
    QMK_USERSPACE=/qmk_userspace
