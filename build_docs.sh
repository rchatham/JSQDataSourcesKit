#!/bin/bash

# Docs by jazzy
# https://github.com/realm/jazzy
# ------------------------------

git submodule update --remote

jazzy -o ./ --source-directory JSQDataSourcesKit/JSQDataSourcesKit/ --readme JSQDataSourcesKit/README.md -a 'Jesse Squires' -u 'https://twitter.com/jesse_squires' -m 'JSQDataSourcesKit' -g 'https://github.com/jessesquires/JSQDataSourcesKit'