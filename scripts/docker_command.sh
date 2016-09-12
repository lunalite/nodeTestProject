#!/usr/bin/env bash

HOST=localhost
PORT=27017

echo "Waiting for the DB ..." > test.log
while :
do
    (echo > /dev/tcp/$HOST/$PORT) >/dev/null 2>&1
    result=$?
    if [[ $result -eq 0 ]]
    then
        echo "DB is up!" >> test.log
        break
   fi
    echo "DB is down, waiting ..." >> test.log
    sleep 1
done

echo "Executing ... " >> test.log
npm run test >> test.log
