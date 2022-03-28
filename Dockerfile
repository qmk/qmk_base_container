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
    libfl2 \
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
    wget -q https://github.com/ZakKemble/avr-gcc-build/releases/download/v8.3.0-1/avr-gcc-8.3.0-x64-linux.tar.bz2 -O - | tee /tmp/asdf.tar.bz2 | md5sum -c <(echo '588D0BEA4C5D21A1A06AA17625684417  -') && \
    tar xfj /tmp/asdf.tar.bz2 --strip-components=1 -C / && \
    rm -rf /share/ /tmp/*"

# Install python packages
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install nose2 yapf qmk

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware
