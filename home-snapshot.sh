#/bin/bash

TIMESTAMP=`date +%Y-%b-%d`

DESTINATION=/media/c7a00755-54a5-4eab-aadf-830a7ca04851

if [[ ! -e $DESTINATION/3553493425 ]]
then
   echo "invalid destination.  maybe mount points changed?  tried: $DESTINATION"
   exit 1
fi

SNAPSHOTS_TAR=$DESTINATION/snapshots/goat-home-snapshot-$TIMESTAMP.tar.gz

echo "creating $SNAPSHOT_TAR"
tar -czv -f $SNAPSHOT_TAR -X excludes-home.txt ~/
echo "done creating $SNAPSHOT_TAR"

