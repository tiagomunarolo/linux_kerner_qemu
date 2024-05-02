#!/bin/bash

LINUX_VERSION=5.15.6

wget https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-${LINUX_VERSION}.tar.gz
tar -xf linux-${LINUX_VERSION}.tar.gz
mv  linux-${LINUX_VERSION} linux_kernel
rm -rf linux-${LINUX_VERSION} linux-${LINUX_VERSION}.tar.gz