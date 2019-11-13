#!/bin/bash

submodule=${PWD##*/}

git submodule deinit "$submodule"
git rm --cached "$submodule"
rm -rf "$submodule"
rm -rf ".git/modules/$submodule"
git config -f .gitmodules --remove-section "submodule.$submodule"
git config -f .git/config --remove-section "submodule.$submodule"