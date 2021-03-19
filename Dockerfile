# Based on the official Ubuntu 20.04 LTS image
FROM ubuntu:20.04

# Install sphinx
RUN apt update && apt -y install python3-sphinx

# Install TexLive
# See https://www.tug.org/texlive/quickinstall.html
RUN apt update && apt -y install wget perl-doc latexmk && \
    mkdir /Temp && cd /Temp && wget -O install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xvf install-tl-unx.tar.gz && \
    $(find . -name "install-tl") --profile /texlive/texlive.profile && \
    cd / && rm -rf /Temp
