#/bin/bash

TIMESTAMP=`date +%Y-%b-%d`

DESTINATION=/media/c7a00755-54a5-4eab-aadf-830a7ca04851

if [[ ! -e $DESTINATION/3553493425 ]]
then
   echo "invalid destination.  maybe mount points changed?  tried: $DESTINATION"
   exit 1
fi

SNAPSHOT_DIR=$DESTINATION/snapshots/current-homes
EXCLUDES_FILE=`ls /home/goat/bin/excludes-home.txt`

rsync -av --delete --exclude-from=$EXCLUDES_FILE /home $SNAPSHOT_DIR/

