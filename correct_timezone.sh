#!/bin/bash

if [ "$1" = "" ]; then
	echo "No Camera Model given"
	exit 1
fi
model="$1"

if [ "$2" = "" ]; then
	echo "No operation given"
	exit 2
fi
operation="$2"

if [ "$3" = "" ]; then
	echo "No Offset given"
	exit 3
fi
offset="$3"

if [ "$4" = "" ]; then
	echo "No new Timezone given"
	exit 4
fi
timezone="$4"

exiftool -overwrite_original "-AllDates${operation}=${offset}" "-timezone=${timezone}" -r "sorted/${model}"

