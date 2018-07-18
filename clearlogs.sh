#!/bin/bash
LOG_DIR=/var/log
ROOT_UID=0
LINES=50
E_XCD=86
E_NOTROOT=87

# Run as Root
if [ "$UID" -ne "$ROOT_UID" ]
then
   echo "Must be root to run this script."
   exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
   lines=$1
else
   lines=$LINES # Default, if not Specified on command-line.
fi
 

cd $LOG_DIR

if [ `pwd` != "$LOG_DIR" ] # or if [ "$PWD" != "$LOG_DIR" ]
                           #Not in /var/log?
then
    echo "Can't Change to $LOG_DIR."
    exit $E_XCD
fi


tail -n $lines messages > mesg.temp
mv mesg.temp messages

cat /dev/null > wtmp
echo "Log files cleaned up."

exit 0
