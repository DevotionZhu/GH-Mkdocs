#!/bin/bash

if [ $# -ne 1 ];then
	echo UAGE:
	echo "   ./autopush.sh <message>"
	exit -1
fi

message=$1

# commit to repository
git add . && git commit -m "$message"

# # push to github
# gitRepository="git@github.com:AplexOS/LoveLife"
# git pull $gitRepository
# git push $gitRepository
