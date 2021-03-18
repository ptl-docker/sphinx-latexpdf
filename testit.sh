#!/bin/bash
echo Test script for the sphinx-texlive docker container

# Get installed version numbers
sphinx-build --version
tex --version

# Make a simple Sphinx workspace and build for latex
mkdir SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1
make latexpdf

#####TESTTEST
find /usr/share -name *.sty
#####TESTTEST

# Artefacts
find . -name *.pdf
