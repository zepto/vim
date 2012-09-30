#!/bin/bash
for i in .*.un*
do 
    mv $i "${HOME}/.vim/tmp/$(pwd|sed 's/\//%/g')%$(echo $i|sed 's/^\.\(\w*\.\w*\)\..*/\1/g')"
done
