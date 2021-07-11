FROM debian:10-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    avr-libc \
    avrdude \
    binutils-avr \
    build-essential \
    ca-certificates \
    clang-format-7 \
    dfu-programmer \
    dfu-util \
    dos2unix \
    ca-certificates \
    gcc \
    gcc-avr \
    git \
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

# upgrade gcc-arm-none-eabi from the default due to ARM runtime issues
RUN /bin/bash -c "set -o pipefail && \
    wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-linux.tar.bz2 -O - | tar xj --strip-components=1 -C / && \
    rm -rf /arm-none-eabi/share/ /share/"

# Install python packages
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN python3 -m pip install nose2 qmk

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware
