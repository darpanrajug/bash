#!/bin/bash

exec >> system_details

DATE=$(date)
echo "Date we logged in to the system"

echo "$DATE"
echo
LOGGED_IN_USERS=$(w)
echo "Below are the logged in users"
echo $LOGGED_IN_USERS
echo

echo "The system uptime"
UPTIME=$(uptime)
echo $UPTIME
