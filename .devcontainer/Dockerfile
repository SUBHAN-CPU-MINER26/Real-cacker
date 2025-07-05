FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Docker + utils
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
    sudo \
    nano \
    wget \
    unzip \
    lsb-release \
    net-tools \
    iputils-ping \
    docker.io \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Docker without sudo
RUN usermod -aG docker root
