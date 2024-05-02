#!/bin/bash
cd /work
# make dir structure
mkdir -p initramfs/{bin,dev,etc,home,mnt,proc,sys,usr}
cd /work/initramfs/dev
sudo mknod sda b 8 0 
sudo mknod console c 5 1
# copy all from busybox
cd /work/initramfs/
cp -a /work/busybox/* .
# init file
echo "#!/bin/sh" >> init
echo "mount -t proc none /proc" >> init
echo "mount -t sysfs none /sys" >> init
echo "exec /bin/sh" >> init
chmod +x init
# init end
# create cpio file
find . -print0 | cpio --null -ov --format=newc > initramfs.cpio 
gzip /work/initramfs/initramfs.cpio
mv /work/initramfs.cpio.gz /work/build_files/
