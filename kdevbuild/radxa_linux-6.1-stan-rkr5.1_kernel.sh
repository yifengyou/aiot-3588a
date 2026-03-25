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

#==========================================================================#
#                        build uboot                                       #
#==========================================================================#
cd ${WORKDIR}/
git clone -b stable-5.10-rock5 https://github.com/radxa/u-boot.git u-boot.git
cd u-boot.git
ls -alh

# apply patch
if ls ${WORKDIR}/radxa-uboot/*.patch >/dev/null 2>&1; then
  git config --global user.name yifengyou
  git config --global user.email 842056007@qq.com
  git am ${WORKDIR}/radxa-uboot/*.patch
fi

tool=$(which aarch64-linux-gnu-gcc)
export CROSS_COMPILE_ARM64="${tool%gcc}"
echo "using gcc: [${CROSS_COMPILE_ARM64}]"

rm -rf spl/u-boot-spl*
make CROSS_COMPILE=${CROSS_COMPILE_ARM64} rockchip-rk3399_defconfig
make CROSS_COMPILE=${CROSS_COMPILE_ARM64} -j$(nproc)
./make.sh rk3399
mv uboot.img ${WORKDIR}/release/uboot.img

ls -alh ${WORKDIR}/release/uboot.img
md5sum ${WORKDIR}/release/uboot.img


#==========================================================================#
#                        build kernel                                      #
#==========================================================================#
cd ${WORKDIR}
git clone -b linux-6.1-stan-rkr5.1 https://github.com/radxa/kernel radxa_kernel.git
cd radxa_kernel.git
ls -alh

# apply patch
if ls "${WORKDIR}/radxa_linux-6.1-stan-rkr5.1/"*.patch >/dev/null 2>&1; then
  git config --global user.name yifengyou
  git config --global user.email 842056007@qq.com
  git am ${WORKDIR}/radxa_linux-6.1-stan-rkr5.1/*.patch
fi

if [ -d ${WORKDIR}/radxa_linux-6.1-stan-rkr5.1 ]; then
  ls -alh ${WORKDIR}/radxa_linux-6.1-stan-rkr5.1/
  cp -a ${WORKDIR}/radxa_linux-6.1-stan-rkr5.1/* .
  ls -alh
fi

# build kernel Image
make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
  owl_rk3399_defconfig

make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
  olddefconfig

# show config
cat .config

# check kver
KVER=$(make LOCALVERSION=-kdev kernelrelease)
KVER="${KVER/kdev*/kdev}"
if [[ "$KVER" != *kdev ]]; then
  echo "ERROR: KVER does not end with 'kdev'"
  exit 1
fi
echo "KVER: ${KVER}"

make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
  dtbs \
   -j$(nproc)

ls -alh arch/arm64/boot/dts/rockchip/rk3399-emb3531.dtb

make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
   -j$(nproc)

make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
  modules -j$(nproc)

make ARCH=arm64 \
  CROSS_COMPILE=aarch64-linux-gnu- \
  KBUILD_BUILD_USER="builder" \
  KBUILD_BUILD_HOST="kdevbuilder" \
  LOCALVERSION=-kdev \
  INSTALL_MOD_PATH=$(pwd)/kos \
  modules_install


# release kernel image
ls -alh arch/arm64/boot/Image
md5sum arch/arm64/boot/Image
cp -a arch/arm64/boot/Image ${WORKDIR}/release/

# release dtb
ls -alh ./arch/arm64/boot/dts/rockchip/rk3399-emb3531.dtb
md5sum ./arch/arm64/boot/dts/rockchip/rk3399-emb3531.dtb
cp -a ./arch/arm64/boot/dts/rockchip/rk3399-emb3531.dtb ${WORKDIR}/release/

# release config
cp .config ${WORKDIR}/release/config-6.1-kdev
ls -alh ${WORKDIR}/release/config-6.1-kdev
md5sum ${WORKDIR}/release/config-6.1-kdev

# release system map
cp System.map ${WORKDIR}/release/System.map-6.1-kdev
ls -alh ${WORKDIR}/release/System.map-6.1-kdev
md5sum ${WORKDIR}/release/System.map-6.1-kdev

# release kernel modules
if [ -d kos/lib/modules ]; then
  find kos -name "*.ko"
  ls -alh kos/lib/modules/
  tar -zcvf ${WORKDIR}/release/kos.tar.gz kos
fi

ls -alh ${WORKDIR}/release/
echo "Build completed successfully!"
exit 0
