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

# copy all get shell scripts and make it executable
COPY get_*.sh ./

# download busybox
RUN ./get_busybox.sh

# download kernel
RUN ./get_kernel.sh

# Copy scripts + build busybox
COPY build_busybox.sh ./
RUN ./build_busybox.sh

# build kernel
COPY build_kernel.sh ./
RUN ./build_kernel.sh

# build final directory data
RUN mkdir -p /work/build_files

# Build init ram file-system
COPY init init
COPY build_rdfs.sh ./
RUN ./build_rdfs.sh

# save bzImage
RUN cp /work/linux_kernel/arch/x86/boot/bzImage /work/build_files

# save vmlinux
RUN cp /work/linux_kernel/vmlinux /work/build_files

# remove shell scripts
RUN rm *.sh

ENTRYPOINT ["/bin/bash"]