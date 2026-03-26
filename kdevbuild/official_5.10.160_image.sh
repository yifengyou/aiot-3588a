#!/bin/bash

set -uxo pipefail

WORKDIR=$(pwd)
export DEBIAN_FRONTEND=noninteractive
export BUILD_TAG="AIOT3588A_5.10.66_${set_rootfs}"

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

mkdir -p official-rk3588-image
cd official-rk3588-image

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/uboot.img
ls -alh uboot.img
mv uboot.img ${WORKDIR}/rockdev/uboot.img
ls -alh ${WORKDIR}/rockdev/uboot.img
md5sum ${WORKDIR}/rockdev/uboot.img

#==========================================================================#
#                        build kernel                                      #
#==========================================================================#
cd ${WORKDIR}

mkdir -p official-rk3588-image
cd official-rk3588-image

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/Image
ls -alh Image
md5sum Image

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/config-5.10.66-kdev
ls -alh config-5.10.66-kdev
md5sum config-5.10.66-kdev

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/System.map-5.10.66-kdev
ls -alh System.map-5.10.66-kdev
md5sum System.map-5.10.66-kdev

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/rk3588-owl-ai-box-plus-v10.dtb
ls -alh rk3588-owl-ai-box-plus-v10.dtb
md5sum rk3588-owl-ai-box-plus-v10.dtb

wget -c https://github.com/yifengyou/aiot-3588a/releases/download/official_5.10.66_kernel/kos.tar.gz
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
cp -a rk3588-owl-ai-box-plus-v10.dtb /mnt/dtb/
cp -f Image /mnt/vmlinuz-5.10.66-kdev
cp -f config-5.10.66-kdev /mnt/config-5.10.66-kdev
cp -f System.map-5.10.66-kdev /mnt/System.map-5.10.66-kdev
touch /mnt/initrd.img-5.10.66-kdev

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
	menu label Linux kernel 5.10.66-kdev
	linux vmlinuz-5.10.66-kdev
	initrd initrd.img-5.10.66-kdev
	fdt /dtb/rk3588-owl-ai-box-plus-v10.dtb
	append root=/dev/mmcblk0p3 rootwait rw console=ttyS2,1500000 console=tty1 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory net.ifnames=0 biosdevname=0 level=10 loglevel=10 selinux=0 crashkernel=384M-:128M systemd.mask=systemd-growfs@-.service rockchip.dmc_freq=528000 video=HDMI-A-1:1920x1080@60

label l0r
	menu label Linux kernel 5.10.66-kdev (rescue target)
	linux vmlinuz-5.10.66-kdev
	initrd initrd.img-5.10.66-kdev
	fdt /dtb/rk3588-owl-ai-box-plus-v10.dtb
	append root=/dev/mmcblk0p3 rootwait rw console=ttyS2,1500000 console=tty1 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory net.ifnames=0 biosdevname=0 level=10 loglevel=10 selinux=0 crashkernel=384M-:128M single

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
# Script Name: Generate Rockchip Updatable Image                           #
# Description: This script is used to generate an updatable image package  #
#              for Rockchip devices, including uboot, boot, and rootfs     #
#              images. The generated images will be placed in the release  #
#              directory for further use or distribution.                  #
#                                                                          #
# Output Directories and Files:                                            #
#   - ${WORKDIR}/rockdev/uboot.img      : U-Boot bootloader image          #
#   - ${WORKDIR}/rockdev/boot.img       : Boot partition image             #
#   - ${WORKDIR}/rockdev/rootfs.img     : Root filesystem image            #
#   - ${WORKDIR}/release                : Directory containing the final   #
#                                         packaged update image            #
#                                                                          #
# Note: Ensure that all necessary source files are present in the          #
#       specified directories before running this script.                  #
#==========================================================================#

# rootfs.img   : ${WORKDIR}/rockdev/rootfs.img
# uboot.img    : ${WORKDIR}/rockdev/uboot.img
# boot.img     : ${WORKDIR}/rockdev/boot.img
# RKDevTool    : ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.19-OWL-RK3588/
# afptool      : ${WORKDIR}/rockchip-tools.git/afptool
# rkImageMaker : ${WORKDIR}/rockchip-tools.git/rkImageMaker
# template     : ${WORKDIR}/update_img_tmp/
# output       : ${WORKDIR}/release/

#cd ${WORKDIR}
#git clone https://github.com/yifengyou/rockchip-tools.git rockchip-tools.git
#ls -alh ${WORKDIR}/rockchip-tools.git
#chmod +x ${WORKDIR}/rockchip-tools.git/afptool
#chmod +x ${WORKDIR}/rockchip-tools.git/rkImageMaker

#mkdir -p ${WORKDIR}/release
#mkdir -p ${WORKDIR}/update_img_tmp
#cp -a ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.19-OWL-RK3588 \
#  ${WORKDIR}/update_img_tmp/RKDevTool
#mkdir -p ${WORKDIR}/update_img_tmp/RKDevTool/rockdev/image/
#
#cp -a ${WORKDIR}/rockdev/uboot.img ${WORKDIR}/update_img_tmp/RKDevTool/rockdev/image/
#cp -a ${WORKDIR}/rockdev/boot.img ${WORKDIR}/update_img_tmp/RKDevTool/rockdev/image/
#cp -a ${WORKDIR}/rockdev/rootfs.img ${WORKDIR}/update_img_tmp/RKDevTool/rockdev/image/
#
#cd ${WORKDIR}/update_img_tmp/RKDevTool/rockdev/image/
#${WORKDIR}/rockchip-tools.git/afptool -pack . temp.img
#${WORKDIR}/rockchip-tools.git/rkImageMaker \
#  -RK3588 MiniLoaderAll.bin \
#  temp.img \
#  update.img \
#  -os_type:androidos
#find . -type f ! -name "update.img" -exec rm -f {} \;
#
## generate update.img
#cd ${WORKDIR}/update_img_tmp/
#rar a ${WORKDIR}/release/${BUILD_TAG}_update.rar RKDevTool
#cd ${WORKDIR}/release/
#sha256sum ${BUILD_TAG}_update.rar

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
cp -a ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.19-OWL-RK3588 \
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
