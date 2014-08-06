#!/bin/bash
# Generate cscope files

echo > cscope.files

find `pwd` -type f \
	-iname '*.[ch]' -o -name '*.cpp' \
	-o -name '*.java' -o -name '*.aidl' \
	-o -name '[Mm]akefile' -o -name '*.mk' \
	-o -name '*.sh' \
	-o -name '*.xml' \
	>> cscope.files

cscope -qkb -i cscope.files

