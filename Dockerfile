# Based on the official Debian image
FROM debian:stable-slim

# Install sphinx
RUN apt update && apt -y install python3-sphinx
