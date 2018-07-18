#!/bin/bash

BACKUPFILE=backup-$(date +%m-%d-%y)
#                 Embeds date in backup filename.

archive=${1:-$BACKUPFILE}
# if no backup-archive filename specified on command-line,
#+ it will default to "backup-MM-DD-YYYY.tar.gz."

tar cvf - `find . -mtime -1 -type f -print` > $archive.tar
gzip $archive.tar
echo "Directory $PWD backedup in archive file \"$archive.tar.gz\"."

# if there are too many files found or if any filenames contain blank characters# its better to use this alternative
### 
# find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive.tar"
# using the GNU version of "find".

# find . -mtime -1 -type f -exec tar rvf "$archive.tar" '{}' \;
#   portable to other UNIX Flavours, but much slower.

exit 0
