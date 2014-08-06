#!/bin/bash

# Generate tag file for lookupfile plugin

# --- all source folder to be add into file name tags ---
# linux/kernel
# build
# bootable
# device hardware vendor
# system frameworks
# external bionic dalvik
# libcore libnativehelper
# developers development packages 
# cts ndk pdk sdk

echo -e "!_TAG_FILE_SORTED\t2\t/2=foldcase/" > fn.tags

# Other source folder list to be added into cscope files
sfl=( \
	linux/kernel \
	build \
	bootable \
	system \
	frameworks \
	hardware/libhardware \
	hardware/libhardware_legacy \
	hardware/broadcom \
	hardware/alsa_sound \
	hardware/ril \
	device/intel \
	device/common \
	vendor/intel \
	)
for i in ${sfl[@]};
do
	find `pwd`/$i \( -name .svn -o -name .git -o -wholename ./classes \) -prune \
		-o -not -iregex '.*\.\(o$\|jar\|gif\|jpg\|png\|class\|exe\|dll\|pdd\|sw[op]\|xls\|doc\|pdf\|zip\|tar\|ico\|ear\|war\|dat\).*' \
		-type f -printf "%f\t%p\t1\n" \
		| sort -f \
		>> fn.tags
done

