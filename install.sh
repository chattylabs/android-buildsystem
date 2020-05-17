#!/bin/bash

# Get submodule name from parameter
submodule="android-buildsystem"

# Remove any old submodule version
declare -a arr=("buildsystem") # deprecated submodules
for i in "${arr[@]}"
do
   oldExists="git submodule status $i"
   if test -z "$oldExists" # If it does exist
   then
       echo "Remove deprecated submodule $i..."
       git submodule deinit "$i"
       git config -f .gitmodules --remove-section "submodule.$i"
       git config -f .git/config --remove-section "submodule.$i"
       git rm --cached "$i"
       rm -rf "./$i"
       rm -rf ".git/modules/$i"
       rm -rf ".gitmodules"
       echo "Submodule $i removed."
   fi
done

# Add & Init or Update submodule
if [[ ! -d "./$submodule" ]] # If it doesn't exist
then
    echo "Adding submodule $submodule..."
    git submodule add -b master --name "$submodule" "git@github.com:chattylabs/$submodule.git"
    git config -f .gitmodules "submodule.$submodule.update" rebase
    git config -f .gitmodules "submodule.$submodule.branch" master
    echo "Submodule $submodule added."
    git submodule update --init --remote --rebase
else
    echo "Updating submodule $submodule..."
    git submodule update --init --remote --rebase
fi

wait # Waits until the process has finished