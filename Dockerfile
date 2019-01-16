FROM ubuntu:16.04
LABEL Description="Image for building and debugging arm-embedded projects from git"

WORKDIR /usr/local
# ADD . /work

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    # Development files
    build-essential \
    # git \
    bzip2 \
    wget && \
    apt clean && \
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/7-2017q4/gcc-arm-none-eabi-7-2017-q4-major-linux.tar.bz2 -O cortex_m.tar.bz2 && \
    tar -xjf cortex_m.tar.bz2 && \
    rm cortex_m.tar.bz2

ENV PATH "/usr/local/gcc-arm-none-eabi-7-2017-q4-major/bin:$PATH"

