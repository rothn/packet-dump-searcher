#!/bin/bash

while read -r file; do
	echo "$file"
	#cat "./session_snapshots/raw/${file}_m.xml"
	#echo ""
	#echo "======"
	cat "./session_snapshots/raw/${file}_c.txt"
	echo ""
	echo "======"
	srv_path="./session_snapshots/raw/${file}_s.txt"
	cat $srv_path
	echo ""
    if grep -q -e "Content-Type: text" "$srv_path" -e "Content-Type: application/json" "$srv_path" && grep -q "Content-Encoding: gzip" "$srv_path"; then
		OFFSET=$(awk 'BEGIN {RS=""} {match($0,/[^[:alnum:][:space:][:punct:]]/)}; {print RSTART; exit}' "$srv_path")
		tail -c +$((OFFSET)) "$srv_path" > tmp.gz
		echo "(unzipped)"
		gunzip -c tmp.gz
		echo ""
	fi
	echo "======"
	echo "######"
done
