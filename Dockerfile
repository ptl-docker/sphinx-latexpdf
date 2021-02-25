# Based on the official Ubuntu 20.04 LTS image
FROM ubuntu:20.04

# Install sphinx
RUN apt update && apt -y install python3-sphinx

# Install MiKTeX (these instructions are for Ubuntu 20.04 only)
RUN apt-get install gnupg &&\
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889 &&\
    echo "deb http://miktex.org/download/ubuntu focal universe" | tee /etc/apt/sources.list.d/miktex.list &&\
    apt-get install miktex
