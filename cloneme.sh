##
# clone fodler
##
#!/usr/bin/env bash
# set -x

S=$1
A="${S/'https://github.com/'/''}"
user="$(cut -d'/' -f1 <<<"$A")" 
repo="$(cut -d'/' -f2 <<<"$A")" 
pathrepo="./$user/$repo"


if [ -d "$pathrepo" ]; then
  mkdir -p $pathrepo
  cd $pathrepo
  git fetch && git pull --progress
else
  git clone --progress $S $pathrepo
fi

cd $pathrepo
git branch -vv


echo done with $pathrepo
