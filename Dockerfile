# Based on the official Ubuntu 20.04 LTS image
FROM ubuntu:20.04

# Install sphinx
RUN apt update && apt -y install python3-sphinx

# Install TexLive
RUN apt update && apt -y install texlive-latex-recommended latexmk
