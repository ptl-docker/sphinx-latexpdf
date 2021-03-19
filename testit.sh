#!/bin/bash
echo Test script for the sphinx-latexpdf docker container

# Get installed version numbers
sphinx-build --version
tex --version

# install missing packages
tlmgr install fncychap titlesec tabulary varwidth framed wrapfig

# Make a simple Sphinx workspace and build for latex
mkdir SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1
make latexpdf

# Artefacts
find . -name *.pdf
