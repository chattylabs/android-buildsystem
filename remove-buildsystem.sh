#!/bin/bash

submodule="android-buildsystem"

git submodule deinit "$submodule"
git rm --cached "$submodule"
rm -rf "$submodule"
rm -rf ".git/modules/$submodule"
git config -f .gitmodules --remove-section "submodule.$submodule"
git config -f .git/config --remove-section "submodule.$submodule"