FROM --platform=linux/x86_64 ubuntu:18.04

# Set root user
USER root

# update packages
RUN apt-get update -y

# upgrade packages
RUN apt-get upgrade -y

# install required packages
# install additional packages
RUN apt-get install -y \
     build-essential patch wget git gcc bison \
     flex bc qemu bzip2 xz-utils libelf-dev \
     libssl-dev libncurses-dev cpio

# set workdir
WORKDIR /work

# copy all shell scripts and make it executable
COPY build_*.sh ./
COPY get_*.sh ./
RUN chmod +x *.sh 

# download busybox
RUN ./get_busybox.sh

# download kernel
RUN ./get_kernel.sh

# build busybox
RUN ./build_busybox.sh

# build kernel
RUN ./build_kernel.sh

# build final directory data
RUN mkdir -p /work/build_files

# Build init ram file-system
RUN ./build_rdfs.sh

# save initramfs
RUN cp /work/initramfs.cpio.gz /work/build_files

# save bzImage
RUN cp /work/linux_kernel/arch/x86_64/boot/bzImage /work/build_files

# save vmlinux
RUN cp /work/linux_kernel/vmlinux /work/build_files

# Finally move all unused folders
RUN mkdir .old && mv *.sh busybox *.gz linux_kernel initramfs .old

ENTRYPOINT ["/bin/bash"]