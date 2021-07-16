#!/bin/bash

git submodule deinit "$1"
git rm "$1"
rm -rf ".git/modules/vim/$1"
git commit

