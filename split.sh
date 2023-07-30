#!/bin/bash

mkdir -p sorted

for filename in raw/*; do
	model="$(exiftool "$filename" | grep "Camera Model Name" | cut -d : -f 2 | xargs)"
	if [ "$model" = "" ]; then
		model="_unknown"
	fi
	mkdir -p "sorted/${model}"
	mv "$filename" "sorted/${model}"
done

