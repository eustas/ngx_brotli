#!/bin/bash
set -e

# Setup shortcuts.
ROOT=`pwd`

# Setup directory structure.
cd $ROOT/script
mkdir test
cd test
mkdir logs

# Download sample texts.
curl --compressed -o war-and-peace.txt http://www.gutenberg.org/files/2600/2600-0.txt

# Restore status-quo.
cd $ROOT
