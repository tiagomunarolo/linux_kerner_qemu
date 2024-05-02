#!/bin/bash
cd linux_kernel
make ARCH=x86 distclean defconfig
sed -i '/# CONFIG_STATIC is not set/c\CONFIG_STATIC=y' .config
make ARCH=x86 -j $(nproc)
