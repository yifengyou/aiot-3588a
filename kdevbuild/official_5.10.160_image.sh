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


cp -a official-firmware/smdt_3588A_ubuntu22.04_20240724_113648/uboot.img ${WORKDIR}/rockdev/uboot.img
ls -alh ${WORKDIR}/rockdev/uboot.img
md5sum ${WORKDIR}/rockdev/uboot.img

#==========================================================================#
#                        build kernel                                      #
#==========================================================================#
cd ${WORKDIR}


cp -a official-firmware/smdt_3588A_ubuntu22.04_20240724_113648/boot.img ${WORKDIR}/rockdev/boot.img
ls -alh ${WORKDIR}/rockdev/boot.img
md5sum ${WORKDIR}/rockdev/boot.img

# update rootfs with official oem firmware/kernel module
if [ -d ${WORKDIR}/official_5.10.160 ]; then
  find ${WORKDIR}/official_5.10.160
  mount ${WORKDIR}/rockdev/rootfs.img /mnt

  if [ -d /mnt/lib/modules/ ]; then
    cp -a ${WORKDIR}/official_5.10.160/lib/modules/* /mnt/lib/modules/
  elif [ -d /mnt/usr/lib/modules ]; then
    cp -a ${WORKDIR}/official_5.10.160/lib/modules/* /mnt/usr/lib/modules/
  fi
  cp -a ${WORKDIR}/official_5.10.160/vendor /mnt/

  ls -alh /mnt/

  sync
  umount /mnt
  sync
fi

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
# RKDevTool    : ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.37-AIOT3588A/
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
#cp -a ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.37-AIOT3588A \
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
cp -a ${WORKDIR}/rockchip-tools.git/RKDevTool-v3.37-AIOT3588A \
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
