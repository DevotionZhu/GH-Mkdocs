#!/bin/bash

ip=127.0.0.1
port=9000

getPid()
{
    pid=`ps aux | grep /usr/local/bin/mkdocs | head -n1 | awk '{print $2}'`
}

if [ ! -z $pid ];then
    kill -9 $pid
    echo "Have kill process $pid"
fi

mkdocs serve --dev-addr=$ip:$port &
echo "mkdocs server has start."
