#!/bin/bash
echo "Checking android-buildsystem..."
git config -f .gitmodules "submodule.android-buildsystem.update" rebase
git config -f .gitmodules "submodule.android-buildsystem.branch" master
git config "alias.supdate" 'submodule update --init --remote --rebase'
git supdate