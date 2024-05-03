#!/bin/bash

# make dir structure
mkdir initramfs && cd initramfs && mkdir -p bin dev etc lib mnt proc sbin sys tmp var

# copy all from busybox
cp -a /work/busybox/_install/* /work/initramfs/
# init file
mv /work/init /work/initramfs/init
chmod +x /work/initramfs/init
# create cpio file
# rm linuxrc
rm /work/initramfs/linuxrc
find . -print0 | cpio --null -ov --format=newc | gzip -9 > /work/build_files/initramfs.cpio.gz