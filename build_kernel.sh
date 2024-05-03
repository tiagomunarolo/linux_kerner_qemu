#!/bin/bash
cd linux_kernel
make ARCH=x86_64 x86_64_defconfig
sed -i '/# CONFIG_STATIC is not set/c\CONFIG_STATIC=y' .config
make ARCH=x86_64 -j $(nproc) bzImage
