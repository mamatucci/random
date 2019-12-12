#!/bin/bash

# Set the user:
user="$1"

# Lists github repositories:
curl -s https://api.github.com/users/$user/repos | sed -n 's/.*clone_url.*"\(.*\)".*/\1/ p'

# Clone all repositories:
for i in `curl -s https://api.github.com/users/$user/repos | sed -n 's/.*clone_url.*"\(.*\)".*/\1/ p'`
do
	 echo git clone "$i" "github-$(basename $i)"
  done


