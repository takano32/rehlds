#!/bin/bash
#
set -eux

#CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
#  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
#  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld ./build.sh --compiler=clang
./build.sh --compiler=clang

