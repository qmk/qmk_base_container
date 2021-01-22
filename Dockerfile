FROM debian:10-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    avr-libc \
    avrdude \
    binutils-arm-none-eabi \
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
    libnewlib-arm-none-eabi \
    python3 \
    python3-pip \
    python3-setuptools \
    software-properties-common \
    tar \
    unzip \
    tar \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

# upgrade gcc-arm-none-eabi from the default 5.4.1 to 6.3.1 due to ARM runtime issues
RUN /bin/bash -c "set -o pipefail && \
    wget -q https://developer.arm.com/-/media/Files/downloads/gnu-rm/6-2017q2/gcc-arm-none-eabi-6-2017-q2-update-linux.tar.bz2 -O - | tar xj --strip-components=1 -C / && \
    rm -rf /arm-none-eabi/share/ /share/"

# Install python packages
RUN pip3 install nose2 qmk jsonschema  # FIXME(skullydazed): remove jsonschema after merge to master

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware
