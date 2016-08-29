#!/bin/bash

message=$1
gitRepository="git@github.com:AplexOS/LoveLife"

if [ $# -ne 1 ];then
	echo USAGE:
	echo "   ./autopush.sh <message>"
	exit -1
fi

if [ $message == "rm" ]; then

    deleteFile=$(git ls-files --deleted)
    if [ ! -n  deleteFile ]; then
        git rm deleteFile
    fi

    # git rm $(git ls-files --deleted)
    echo "deleted repository."
    exit 0
fi

if [ $message == "push" ]; then
    git pull "$gitRepository" && git push "$gitRepository"

    echo "push to repository."
    exit 0
fi

# commit to repository and push to github
git add . && git commit -m "$message" && git pull "$gitRepository" && git push "$gitRepository"
