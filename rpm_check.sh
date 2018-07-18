#!/bin/bash
# rpm-check.sh

# This script illustrates using a code block.

SUCCESS_EXIT_STATUS=0
ERROR_EXIT_STATUS=65

if [ -z "$1" ]
then
   echo "Usage: `basename $0` rpm-file"
   exit $ERROR_EXIT_STATUS
fi

{ # Begin code block.
   echo
   echo "Archive Description:"
   rpm -qpi $1 # Query description
   echo 
   echo "Archive Listing:"
   rpm -qpl $1 # Query Listing
   echo
   rpm -i --test $1 # Query whether rpm file can be installed.
   if [ "$?" -eq $SUCCESS_EXIT_STATUS ]
   then
      echo "$1 can be installed."
   else
      echo "$1 cannot be installed."
   fi
   echo       # end code block.
} > "$1.test"   # Redirects output of everything in block to file.

echo "Results of rpm test in file $1.test"

# See rpm man page for explanation of options.(This is for rpm based distros)
exit 0

echo
