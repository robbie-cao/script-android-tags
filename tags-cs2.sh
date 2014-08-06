#!/bin/bash
# Generate cscope files for $1
# Usage:
# ./tag2 srctree reffile

msg="Usage: ./tag2 srcpath reffile"

if [ $# != 2 ];
then
	echo $msg
	exit
fi

if [ ! -d $1 ];
then
	echo $1 not exist!
	exit
fi

echo Generate cscope files for $1 into $2.out

echo > $2.files

find `pwd`/$1 -type f \
	-name '*.[ch]' -o -name '*.cpp' \
	-o -name '*.java' -o -name '*.aidl' \
	-o -name '[Mm]akefile' -o -name '*.mk' \
	-o -name '*.sh' \
	>> $2.files

cscope -qkb -i $2.files -f $2.out

