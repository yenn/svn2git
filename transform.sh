#!/bin/bash

#move
path=`pwd`
base=`basename $path`
dir="${base}.git"
mkdir "../${dir}"
cp -r ./* ./.s* "../"$dir
find "../"$dir -name .svn | xargs rm -rf
find "../"$dir -name .svnignore | xargs dirname | while IFS= read -r pathname; do mv "$pathname/.svnignore" "$pathname/.gitignore"; done

#create git repo
cd "../"$dir
git init
git add * .g*
git commit -am "Initial commit."
