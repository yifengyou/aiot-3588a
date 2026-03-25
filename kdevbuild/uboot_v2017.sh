#!/bin/bash

set -euxo pipefail

WORKDIR=$(pwd)
export DEBIAN_FRONTEND=noninteractive

#==========================================================================#
#                        init build env                                    #
#==========================================================================#
apt-get update
apt-get install -qq -y ca-certificates
apt-get install -qq -y --no-install-recommends \
  build-essential ca-certificates ccache curl \
  device-tree-compiler vim dosfstools fakeroot file \
  flex gawk gcc-aarch64-linux-gnu git gnupg jq \
  libssl-dev locales lsb-release lzop make \
  ncurses-dev parted patch pigz python python3 \
  python3-distutils python3-pip rsync sed sudo \
  u-boot-tools unzip wget xxd xz-utils zip \
  binwalk zlib1g-dev squashfs-tools rar liblz4-tool \
  genext2fs bc htop openssh-client

localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 || true
mkdir -p ${WORKDIR}/rockdev
mkdir -p ${WORKDIR}/release

#==========================================================================#
#                        build uboot                                       #
#==========================================================================#
cd ${WORKDIR}/
git clone --depth 1 -b master https://github.com/yifengyou/emb3531-uboot.git emb3531-uboot.git
cd emb3531-uboot.git
ls -alh

# clean before build
make mrproper

# build uboot.img
make ARCH=arm CROSS_COMPILE=aarch64-linux-gnu- emb3531-rk3399_defconfig all -j$(nproc)
rkthings/loaderimage --pack --uboot u-boot-dtb.bin uboot.img 0x200000
ls -alh uboot.img

# build trust.img
cd rkthings
./trust_merger trust.ini
mv trust.img ../

# put image to release
mv ../uboot.img ${WORKDIR}/release/uboot.img
mv ../trust.img ${WORKDIR}/release/trust.img

ls -alh ${WORKDIR}/release/uboot.img
md5sum ${WORKDIR}/release/uboot.img

ls -alh ${WORKDIR}/release/trust.img
md5sum ${WORKDIR}/release/trust.img

ls -alh ${WORKDIR}/release/
echo "Build completed successfully!"
exit 0
