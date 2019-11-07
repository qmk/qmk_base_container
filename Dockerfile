FROM debian:11-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    avrdude \
    binutils-arm-none-eabi \
    binutils-riscv64-unknown-elf \
    build-essential \
    ca-certificates \
    clang-format-11 \
    dfu-programmer \
    dfu-util \
    dos2unix \
    ca-certificates \
    gcc \
    gcc-arm-none-eabi \
    gcc-riscv64-unknown-elf \
    git \
    libnewlib-arm-none-eabi \
    picolibc-riscv64-unknown-elf \
    python3 \
    python3-pip \
    software-properties-common \
    tar \
    teensy-loader-cli \
    unzip \
    tar \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

# upgrade avr-gcc... for reasons?
RUN /bin/bash -c "set -o pipefail && \
    wget -q https://blog.zakkemble.net/download/avr-gcc-8.3.0-x64-linux.tar.bz2 -O - | tar xj --strip-components=1 -C /"

# Install python packages
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install nose2 qmk

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware
