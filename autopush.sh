#!/bin/bash

message=$1
gitRepository="git@github.com:AplexOS/LoveLife"

# we need message to judge what to do
if [ $# -ne 1 ];then
	echo USAGE:
	echo "   ./autopush.sh <message>"
	exit -1
fi

# git remove all delete files
if [ $message == "rm" ]; then

    deleteFile=$(git ls-files --deleted)
    if [ ! -n  deleteFile ]; then
        git rm deleteFile
    fi

    # git rm $(git ls-files --deleted)
    echo "deleted repository."
    exit 0
fi

# git push local repository to remote
if [ $message == "push" ]; then
    git pull "$gitRepository" && git push "$gitRepository"

    echo "push to repository."
    exit 0
fi

# add to stage and commit to local repository and push to github
git add . && git commit -m "$message" && git pull "$gitRepository" && git push "$gitRepository"
