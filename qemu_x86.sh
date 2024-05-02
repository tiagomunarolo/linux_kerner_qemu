#!/bin/sh
qemu-system-x86_64 \
    -kernel ./build_files/bzImage \
    -initrd  ./build_files/initramfs.cpio.gz  \
    -nographic -append "earlyprintk=serial,ttyS0 console=ttyS0"