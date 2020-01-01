#!/bin/bash

#submodule=${PWD##*/}
remove="$1"
update="$2"

echo "Update submodule from $remove to $update"

git submodule deinit "$remove"
git rm --cached "$remove"
rm -rf "./$remove"
rm -rf ".git/modules/$remove"
git config -f .gitmodules --remove-section "submodule.$remove"
git config -f .git/config --remove-section "submodule.$remove"

git submodule add -b master --name "$update" git@github.com:chattylabs/android-buildsystem.git
git config -f .gitmodules "submodule.$update.update" rebase