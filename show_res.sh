#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
files=$(find ./ -type f -exec ls {} + | grep ".*\.mkv$\|.*\.mp4$") # Adjust regex for desired formats
for f in ${files}
do
  resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=s=x:p=0 ${f})
  printf "%-100s %-10s\\n" "$f" "$resolution"
done
IFS="$OIFS"

