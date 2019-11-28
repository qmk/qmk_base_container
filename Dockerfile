FROM debian:10-slim

RUN apt-get update && apt-get install --no-install-recommends -y \
    avrdude \
    binutils-arm-none-eabi \
    build-essential \
    ca-certificates \
    clang-format-7 \
    dfu-programmer \
    dfu-util \
    ca-certificates \
    gcc \
    git \
    libfl2 \
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

# upgrade avr-gcc... for reasons?
RUN /bin/bash -c "set -o pipefail && \
    wget -q https://blog.zakkemble.net/download/avr-gcc-8.3.0-x64-linux.tar.bz2 -O - | tee /tmp/asdf.tar.bz2 | md5sum -c <(echo '588D0BEA4C5D21A1A06AA17625684417  -') && \
    tar xfj /tmp/asdf.tar.bz2 --strip-components=1 -C / && \
    rm -rf /share/ /tmp/*"

# Install python packages
RUN pip3 install nose2 qmk

# Set the default location for qmk_firmware
ENV QMK_HOME /qmk_firmware
