FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  curl ca-certificates sudo nano wget \
  unzip lsb-release net-tools iputils-ping gnupg \
  docker.io docker-compose \
  && apt-get clean
