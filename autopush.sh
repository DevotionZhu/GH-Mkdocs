#!/bin/bash

if [ $# -ne 1 ];then
	echo UAGE:
	echo "   ./autopush.sh <message>"
	exit -1
fi

message=$1
gitRepository="git@github.com:AplexOS/LoveLife"

git rm $(git ls-files --deleted)

# commit to repository and push to github
git add . && git commit -m "$message" && git pull "$gitRepository" && git push "$gitRepository"
