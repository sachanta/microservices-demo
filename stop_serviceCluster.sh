#!/bin/bash

# ps -ef|grep java|grep Tier|awk '{print $2}'
for i in `ps -ef|grep java|grep msapp|awk '{print $2}'|xargs echo`
do
   echo "Killing java process $i"
   kill $i
done
