#!/bin/bash
echo Test script for the sphinx-latexpdf docker container

# Get installed version numbers
sphinx-build --version
tex --version

# install missing packages
tlmgr install fncychap tabulary latexmk ulem environ trimspaces titlesec \
              varwidth framed threeparttable wrapfig upquote capt-of \
              multirow eqparbox needspace

# Make a simple Sphinx workspace and build for latex
mkdir SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1
make latexpdf

# Artefacts
find . -name *.pdf
