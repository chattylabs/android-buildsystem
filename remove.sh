#!/bin/bash

#submodule=${PWD##*/}
submodule="$1"

echo "Removing submodule $1"

git submodule deinit "$submodule"
git rm --cached "$submodule"
rm -rf "./$submodule"
rm -rf ".git/modules/$submodule"
git config -f .gitmodules --remove-section "submodule.$submodule"
git config -f .git/config --remove-section "submodule.$submodule"