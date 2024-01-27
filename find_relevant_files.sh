#!/bin/bash

grep -rIlFf to_look_for.txt ./session_snapshots --exclude=\*.xml | ./_filter_files.sh | sort -V | uniq | ./_print_files.sh
