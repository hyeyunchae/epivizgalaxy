#!/bin/bash
while true; do
    sleep 60
    if [ `netstat -t | grep -v CLOSE_WAIT | grep ':80' | wc -l` -lt 3 ]
    then
        pkill nginx
    fi
done
