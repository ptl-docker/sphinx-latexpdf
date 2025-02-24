# Based on the official Ubuntu 20.04 LTS image
FROM ubuntu:20.04

##################################################
# sphinx

# Install sphinx
# tzdata asks interactively for timezone information so is installed separately
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata && \
    apt -y install python3-pip && \
    pip3 install sphinx

# Enable svg image support
RUN apt update && \
    apt -y install inkscape && \
    pip3 install sphinxcontrib-svg2pdfconverter

##################################################
# texlive

# Update the docker context to include the texlive folder (contains the profile)
RUN mkdir /Temp
ADD texlive /Temp/texlive

# Install TexLive
# See https://www.tug.org/texlive/quickinstall.html
RUN apt update && apt -y install wget perl-doc && \
    cd /Temp && wget -O install-tl-unx.tar.gz http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xvf install-tl-unx.tar.gz && \
    $(find . -name "install-tl") --profile ./texlive/texlive.profile

# Modify the environment, as suggested by install-tl
# Note: These paths are determined by texlive.profile
ENV PATH "$PATH:/usr/local/texlive/bin/x86_64-linux"
ENV MANPATH "$MANPATH:/usr/local/texlive/texmf-dist/doc/man"
ENV INFOPATH "$INFOPATH:/usr/local/texlive/texmf-dist/doc/info"

# Additional additional required texlive packages
RUN tlmgr install latexmk fncychap tabulary latexmk ulem environ trimspaces titlesec \
                  varwidth framed threeparttable wrapfig upquote capt-of \
                  multirow eqparbox needspace

##################################################
# Tidy up
RUN rm -rf /Temp && \
    cat /usr/local/texlive/tlpkg/texlive.profile && \
    sphinx-build --version && \
    tex --version && \
    inkscape --version
