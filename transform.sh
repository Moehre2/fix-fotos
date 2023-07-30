#!/bin/bash

exiftool "-filename<CreateDate" -d %Y/%m/%d-%H_%M_%S%-03.c.%%e -r merged

