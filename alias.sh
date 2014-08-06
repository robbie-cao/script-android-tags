# Set cross compile tool alias
export CROSS=`pwd`/prebuilts/gcc/linux-x86/x86/x86_64-linux-android-4.7/bin/x86_64-linux-android-

alias addr2line=${CROSS}addr2line
alias ar=${CROSS}ar
alias as=${CROSS}as
alias cpp=${CROSS}cpp
alias elfedit=${CROSS}elfedit
alias gcc=${CROSS}gcc
alias gcov=${CROSS}gcov
alias gdb=${CROSS}gdb
alias gprof=${CROSS}gprof
alias nm=${CROSS}nm
alias objcopy=${CROSS}objcopy
alias objdump=${CROSS}objdump
alias ranlib=${CROSS}ranlib
alias readelf=${CROSS}readelf
alias size=${CROSS}size
alias strings=${CROSS}strings
alias strip=${CROSS}strip

