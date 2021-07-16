#!/usr/bin/bash

git submodule init
git submodule add "$1" "$2"
git add .gitmodules "$2"
git commit

