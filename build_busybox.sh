#!/bin/bash
cd busybox
make ARCH=x86_64 distclean defconfig
sed -i '/# CONFIG_STATIC is not set/c\CONFIG_STATIC=y' .config
make ARCH=x86_64 -j $(nproc)
make ARCH=x86_64 install
