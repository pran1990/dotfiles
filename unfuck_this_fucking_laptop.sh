#!/bin/bash

while [ true ]; do
pkill -STOP -of splunk
pkill -STOP -f sweep
pkill -STOP -f Sophos
pkill -STOP -of osqueryd
sleep 5
done
