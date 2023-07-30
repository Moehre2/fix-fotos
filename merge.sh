#!/bin/bash

mkdir -p merged

for model in sorted/*; do
	mv "$model"/* merged
	rmdir "$model"
done

