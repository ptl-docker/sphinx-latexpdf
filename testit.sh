#!/bin/bash
echo Test script for the sphinx-MiKTeX docker container

# Get installed version numbers
sphinx-build --version

# Make a simple Sphinx workspace and build for latex
mkdir SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1
make latexpdf

# Artefacts
find . -name *.pdf
