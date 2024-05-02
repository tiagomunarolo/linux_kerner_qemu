#!/bin/sh

BUSYBOX_VERSION=1.34.1

wget https://busybox.net/downloads/busybox-${BUSYBOX_VERSION}.tar.bz2
tar -xf busybox-${BUSYBOX_VERSION}.tar.bz2
mv  busybox-${BUSYBOX_VERSION} busybox
rm -rf busybox-${BUSYBOX_VERSION} busybox-${BUSYBOX_VERSION}.tar.bz2