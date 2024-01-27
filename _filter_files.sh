#!/bin/bash

while read -r file; do
	head -n 1 "$file" | grep -qE "^CONNECT" && continue
	grep -q -F 'Encrypted HTTPS traffic flows through this CONNECT tunnel.' "$file" && continue
	if ! grep -q -F 'Encrypted HTTPS traffic flows through this CONNECT tunnel.' "$file"  # Check if the file contains the specified string
    then
        echo "$file" | grep -Eo "[0-9]+"
    fi
done
