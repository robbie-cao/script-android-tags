#!/bin/bash
# Generate cscope files

# --- all source folder to be add into cscope ---
# linux/kernel
# build
# bootable
# device hardware vendor
# system frameworks
# external bionic dalvik
# libcore libnativehelper
# developers development packages 
# cts ndk pdk sdk

echo > cscope.files

# Generate kernel source files
srctree=`pwd`/linux/kernel SRCARCH=x86 ./tags-kernel.sh cscope

# Other source folder list to be added into cscope files
sfl=( \
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
	find `pwd`/$i -type f \
		-name '*.[ch]' -o -name '*.cpp' \
		-o -name '*.java' -o -name '*.aidl' \
		-o -name '[Mm]akefile' -o -name '*.mk' \
		-o -name '*.sh' \
		>> cscope.files
done

cscope -qkb -i cscope.files

