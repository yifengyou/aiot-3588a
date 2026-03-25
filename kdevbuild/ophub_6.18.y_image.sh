#!/bin/bash

set -euxo pipefail

WORKDIR=$(pwd)
export DEBIAN_FRONTEND=noninteractive
export BUILD_TAG="EMB3531_6.18.y_${set_rootfs}"

#==========================================================================#
#                        init build env                                    #
#==========================================================================#
apt-get update
apt-get install -qq -y ca-certificates
apt-get install -qq -y --no-install-recommends \
  acl aptly aria2 axel bc binfmt-support binutils-aarch64-linux-gnu bison \
  bsdextrautils btrfs-progs build-essential busybox ca-certificates ccache \
  clang coreutils cpio crossbuild-essential-arm64 cryptsetup curl \
  debian-archive-keyring debian-keyring debootstrap device-tree-compiler \
  dialog dirmngr distcc dosfstools dwarves e2fsprogs expect f2fs-tools \
  fakeroot fdisk file flex gawk gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi \
  gdisk git gnupg gzip htop imagemagick jq kmod lib32ncurses-dev \
  lib32stdc++6 libbison-dev libc6-dev-armhf-cross libc6-i386 libcrypto++-dev \
  libelf-dev libfdt-dev libfile-fcntllock-perl libfl-dev libfuse-dev \
  libgcc-12-dev-arm64-cross libgmp3-dev liblz4-tool libmpc-dev libncurses-dev \
  libncurses5 libncurses5-dev libncursesw5-dev libpython2.7-dev \
  libpython3-dev libssl-dev libusb-1.0-0-dev linux-base lld llvm locales \
  lsb-release lz4 lzma lzop make mtools ncurses-base ncurses-term \
  nfs-kernel-server ntpdate openssl p7zip p7zip-full parallel parted patch \
  patchutils pbzip2 pigz pixz pkg-config pv python2 python2-dev python3 \
  python3-dev python3-distutils python3-pip python3-setuptools \
  python-is-python3 qemu-user-static rar rdfind rename rsync sed \
  squashfs-tools swig tar tree u-boot-tools udev unzip util-linux uuid \
  uuid-dev uuid-runtime vim wget whiptail xfsprogs xsltproc xxd xz-utils \
  zip zlib1g-dev zstd binwalk ripgrep sudo
localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 || true
mkdir -p ${WORKDIR}/rockdev
mkdir -p ${WORKDIR}/release
mkdir -p /dev

#==========================================================================#
# Task: Build Root Filesystem (rootfs) using Armbian Build System          #
#==========================================================================#
mkdir -p ${WORKDIR}/rootfs
cd ${WORKDIR}/rootfs/

if [ -z "${set_vendor}" ] || [ -z "${set_rootfs}" ]; then
  echo "skip rootfs build"
else
  echo "ROOTFS:${set_rootfs}"
  ROOTFS_URL="https://github.com/yifengyou/kdev/releases/download/${set_vendor}-rootfs/${set_rootfs}"
  echo "ROOTFS_URL:${ROOTFS_URL}"

  aria2c --check-certificate=false \
    --max-connection-per-server=16 \
    --split=16 \
    --human-readable=true \
    --summary-interval=5 \
    -o ${set_rootfs} \
    "${ROOTFS_URL}"

  ls -alh
  rar x ${set_rootfs}
  ls -alh
  mv rootfs.img ${WORKDIR}/rockdev/rootfs.img
  ls -alh ${WORKDIR}/rockdev
fi

ls -alh ${WORKDIR}/rockdev/rootfs.img

#==========================================================================#
#                        build uboot                                       #
#==========================================================================#
cd ${WORKDIR}

mkdir -p ophub_6.18.y
cd ophub_6.18.y

wget -c https://github.com/yifengyou/EMB3531/releases/download/uboot_v2017/uboot.img
wget -c https://github.com/yifengyou/EMB3531/releases/download/uboot_v2017/trust.img
ls -alh uboot.img trust.img
mv uboot.img ${WORKDIR}/rockdev/uboot.img
mv trust.img ${WORKDIR}/rockdev/trust.img
ls -alh ${WORKDIR}/rockdev/*.img
md5sum ${WORKDIR}/rockdev/*.img

#==========================================================================#
#                        build kernel                                      #
#==========================================================================#
cd ${WORKDIR}

mkdir -p ophub_6.18.y
cd ophub_6.18.y

wget -c https://github.com/yifengyou/EMB3531/releases/download/ophub_6.18.y_kernel/Image
ls -alh Image
md5sum Image

wget -c https://github.com/yifengyou/EMB3531/releases/download/ophub_6.18.y_kernel/config-6.18.y-kdev
ls -alh config-6.18.y-kdev
md5sum config-6.18.y-kdev

wget -c https://github.com/yifengyou/EMB3531/releases/download/ophub_6.18.y_kernel/System.map-6.18.y-kdev
ls -alh System.map-6.18.y-kdev
md5sum System.map-6.18.y-kdev

wget -c https://github.com/yifengyou/EMB3531/releases/download/ophub_6.18.y_kernel/rk3399-emb3531.dtb
ls -alh rk3399-emb3531.dtb
md5sum rk3399-emb3531.dtb

wget -c https://github.com/yifengyou/EMB3531/releases/download/ophub_6.18.y_kernel/kos.tar.gz
ls -alh kos.tar.gz
md5sum kos.tar.gz
tar -xf kos.tar.gz

# update rootfs with ko
if [ -d kos/lib/modules ]; then
  mount "${WORKDIR}/rockdev/rootfs.img" /mnt || exit 1
  REQ=$(du -sk kos/lib/modules | awk '{print $1}')
  AVAIL=$(df -k /mnt | tail -1 | awk '{print $4}')
  if [ "$AVAIL" -ge "$REQ" ]; then
    rm -rf /mnt/lib/modules/*
    mkdir -p /mnt/lib/modules
    cp -a kos/lib/modules/* /mnt/lib/modules
    sync
  else
    echo "Warning: Insufficient space on /mnt (Need: ${REQ}KB, Have: ${AVAIL}KB)"
  fi
  umount /mnt
  sync
fi

# update rootfs with firmware
if [ -d ${WORKDIR}/firmware ]; then
  find ${WORKDIR}/firmware
  mount ${WORKDIR}/rockdev/rootfs.img /mnt
  mkdir -p /mnt/lib/firmware
  cp -a ${WORKDIR}/firmware/* /mnt/lib/firmware/
  ls -alh /mnt/lib/firmware/
  sync
  umount /mnt
  sync
fi

# generate boot.img
dd if=/dev/zero of=boot.img bs=1M count=256
mkfs.ext2 -U 7A3F0000-0000-446A-8000-702F00006273 -L kdevboot boot.img
mount boot.img /mnt

mkdir -p /mnt/dtb
cp -a rk3399-emb3531.dtb /mnt/dtb/
cp -f Image /mnt/vmlinuz-6.18.y-kdev
cp -f config-6.18.y-kdev /mnt/config-6.18.y-kdev
cp -f System.map-6.18.y-kdev /mnt/System.map-6.18.y-kdev
touch /mnt/initrd.img-6.18.y-kdev

cat >/mnt/extlinux.conf <<EOF
## /extlinux/extlinux.conf
##
## IMPORTANT WARNING
##
## The configuration of this file is generated automatically.
## Do not edit this file manually, use: u-boot-update

default l0
menu title Kdev U-Boot menu
prompt 1
timeout 90


label l0
	menu label Linux kernel 6.18.y-kdev
	linux vmlinuz-6.18.y-kdev
	initrd initrd.img-6.18.y-kdev
	fdt /dtb/rk3399-emb3531.dtb
	append root=PARTUUID=614e0000-0000-4b53-8000-1d28000054a9 rootwait rw console=ttyS2,1500000 console=tty1 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory net.ifnames=0 biosdevname=0 level=10 loglevel=10 selinux=0 crashkernel=384M-:128M systemd.mask=systemd-growfs@-.service rockchip.dmc_freq=528000 video=HDMI-A-1:1920x1080@60

label l0r
	menu label Linux kernel 6.18.y-kdev (rescue target)
	linux vmlinuz-6.18.y-kdev
	initrd initrd.img-6.18.y-kdev
	fdt /dtb/rk3399-emb3531.dtb
	append root=PARTUUID=614e0000-0000-4b53-8000-1d28000054a9 rootwait rw console=ttyS2,1500000 console=tty1 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory net.ifnames=0 biosdevname=0 level=10 loglevel=10 selinux=0 crashkernel=384M-:128M single

EOF

cat >/mnt/armbian_first_run.txt <<EOF
root_password=admin
username=admin
user_password=admin
shell=bash

EOF

find /mnt
sync
umount /mnt
sync

ls -alh boot.img
md5sum boot.img

cp -a boot.img ${WORKDIR}/rockdev/boot.img
ls -alh ${WORKDIR}/rockdev/boot.img
md5sum ${WORKDIR}/rockdev/boot.img


#==========================================================================#
# Script Purpose: Generate Rockchip Firmware Image with RKDevTool          #
#                                                                          #
# This script prepares the required partition images and packages them     #
# into a firmware update bundle compatible with Rockchip's RKDevTool.      #
#                                                                          #
# Input Images (must exist before execution):                              #
#   - ${WORKDIR}/rockdev/uboot.img   : U-Boot bootloader image             #
#   - ${WORKDIR}/rockdev/boot.img    : Kernel + DTB boot image             #
#   - ${WORKFS}/rockdev/rootfs.img   : Root filesystem image               #
#                                                                          #
# Output:                                                                  #
#   - ${WORKDIR}/release/            : Final RKDevTool-compatible firmware #
#                                      package (e.g., update.img)          #
#                                                                          #
# Note: Verify that all source images are correctly built and placed in    #
#       the ${WORKDIR}/rockdev/ directory prior to running this script.    #
#==========================================================================#

# rootfs.img   : ${WORKDIR}/rockdev/rootfs.img
# uboot.img    : ${WORKDIR}/rockdev/uboot.img
# boot.img     : ${WORKDIR}/rockdev/boot.img
# output       : ${WORKDIR}/release/

cd ${WORKDIR}
git clone https://github.com/yifengyou/rockchip-tools.git rockchip-tools.git
ls -alh ${WORKDIR}/rockchip-tools.git

mkdir -p ${WORKDIR}/release
mkdir -p ${WORKDIR}/rockdev_img_tmp
cp -a ${WORKDIR}/rockchip-tools.git/RKDevTool-v2.84-EMB3531 \
  ${WORKDIR}/rockdev_img_tmp/RKDevTool
mkdir -p ${WORKDIR}/rockdev_img_tmp/RKDevTool/rockdev/image/

cp -a ${WORKDIR}/rockdev/uboot.img ${WORKDIR}/rockdev_img_tmp/RKDevTool/rockdev/image/
cp -a ${WORKDIR}/rockdev/boot.img ${WORKDIR}/rockdev_img_tmp/RKDevTool/rockdev/image/
cp -a ${WORKDIR}/rockdev/rootfs.img ${WORKDIR}/rockdev_img_tmp/RKDevTool/rockdev/image/

cd ${WORKDIR}/rockdev_img_tmp/
rar a ${WORKDIR}/release/${BUILD_TAG} RKDevTool
cd ${WORKDIR}/release/
sha256sum ${BUILD_TAG}

ls -alh ${WORKDIR}/release/

echo "Build completed successfully!"
exit 0
