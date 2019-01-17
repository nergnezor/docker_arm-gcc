FROM ubuntu:16.04
LABEL Description="Image for building and debugging arm-embedded projects from git"

ARG version=7.2.1
ARG name=gcc-arm-none-eabi-7-2017-q4-major
ARG path=7-2017q4
ENV GNU_VERSION=${version}
ENV GNU_NAME=${name}
ENV GNU_PATH=${path}

WORKDIR /usr/local

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    # Development files
    build-essential \
    curl \
    bzip2 \
    wget && \
    apt clean && \
    wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/${GNU_PATH}/${GNU_NAME}-linux.tar.bz2 -O cortex_m.tar.bz2 && \
    tar -xjf cortex_m.tar.bz2 && \
    rm cortex_m.tar.bz2

ENV PATH "/usr/local/${GNU_NAME}/bin:$PATH"

