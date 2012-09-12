#!/bin/bash

DESTINATION=/media/c7a00755-54a5-4eab-aadf-830a7ca04851

if [[ ! -e $DESTINATION/3553493425 ]]
then
echo "invalid destination.  maybe mount points changed?  tried: $DESTINATION"
exit 1
fi

echo -n "syncing music..."
rsync -av --delete ~/Music $DESTINATION
echo "done."

echo -nv "syncing docs..."
rsync -av --delete ~/Documents $DESTINATION
echo "done."

echo -n "syncing pics..."
rsync -av --delete ~/Pictures $DESTINATION
echo "done."

echo -n "syncing permanent-archive..."
rsync -av ~/permanent-archive $DESTINATION
echo "done."
