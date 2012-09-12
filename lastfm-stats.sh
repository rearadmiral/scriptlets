#!/bin/bash

set -e

DATE_PATTERN=`date +%Y%m%d`
FILENAME=stats-${DATE_PATTERN}.txt
STARS_FILENAME=stars-${DATE_PATTERN}.txt
STATS_FOLDER=~/temp/ipod-stats

mkdir -p $STATS_FOLDER

SCRIPTS_HOME=~/bin/ipod_lastfm_bridge
FILE=$STATS_FOLDER/$FILENAME
STAR_FILE=$STATS_FOLDER/$STARS_FILENAME

cd $SCRIPTS_HOME

echo -n "saving playcounts to $FILE..."
./get_play_counts.rb > $FILE
echo "done."

echo -n "saving stars to $STAR_FILE..."
./get_ratings.rb > $STAR_FILE
echo "done."

echo -n "manually dropping playcounts off iPod..."
rm /media/GOATPOD/iPod_Control/iTunes/Play\ Counts
echo "done."

echo "iPod can be removed after safely unmounting it."

cat $FILE | ./as_submit.rb

