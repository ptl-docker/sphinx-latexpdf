#!/bin/bash
echo Test script for the sphinx-MiKTeX docker container

sphinx-build --version

# Make a simple Sphinx workspace
md SphinxTest
cd SphinxTest
sphinx-quickstart -q -p MyProject -a Snoopy -v 0.1

ls -l
