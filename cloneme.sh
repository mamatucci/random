##
# clone fodler
##
#!/usr/bin/env bash
# set -x

S=$1
A="${S/'git@github.com:'/''}"
userrepo="$(cut -d'/' -f1 <<<"$A")" 
repo="$(cut -d'/' -f2 <<<"$A")"
pathrepo="$userrepo/$repo"

 
echo $userrepo
echo $repo
echo $pathrepo
 

if [ -d "$pathrepo" ]; then
  echo pulling...
  cd $pathrepo
  git fetch && git pull --progress
else
  echo cloning...
  mkdir -p $pathrepo
  cd $pathrepo
  git clone --progress $S $repo  # nohup   ...  '&>' $repo.out'&' 
fi

cd $repo
git branch -vv


echo done with $pathrepo

