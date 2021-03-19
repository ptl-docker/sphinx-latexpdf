#!/bin/bash
echo Test script for the sphinx-texlive docker container

# Get installed version numbers
sphinx-build --version
tex --version

#####TESTTEST
#find /usr/share -name *.sty
tlmgr init-usertree
tlmgr update --all
tlmgr install fncychap
#####TESTTEST

# Make a simple Sphinx workspace and build for latex
mkdir SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1
make latexpdf

# Artefacts
find . -name *.pdf
