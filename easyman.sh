#!/bin/sh

if [ $# -eq 0 ]; then
	echo "Usage: easyman [command] [optional: argument]" && echo "Example: easyman ls -R"&& exit 1
fi
if [ $# -eq 1 ]; then
	man $1
fi
if [ $# -eq 2 ]; then
	man $1 |grep -e $2 -n -A 5 
fi
