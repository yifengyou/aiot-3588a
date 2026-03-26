#!/bin/bash

set -uxo pipefail

WORKDIR=$(pwd)
export DEBIAN_FRONTEND=noninteractive

#==========================================================================#
#                        init build env                                    #
#==========================================================================#
apt-get update
apt-get install -qq -y ca-certificates
apt install -y --no-install-recommends \
  acl android-tools-adb aptly aria2 autoconf autotools-dev axel bc \
  binfmt-support binutils binutils-aarch64-linux-gnu bison \
  btrfs-progs build-essential busybox ca-certificates ccache clang cmake \
  coreutils cpio crossbuild-essential-arm64 cryptsetup curl cvs \
  debian-archive-keyring debian-keyring debootstrap device-tree-compiler \
  dialog dirmngr distcc dosfstools dwarves e2fsprogs expect f2fs-tools \
  fakeroot fdisk file flex gawk gcc gcc-aarch64-linux-gnu gcc-arm-linux-gnueabi \
  g++ gdisk git gnupg gzip htop imagemagick intltool jq kmod keychain \
  lib32ncurses-dev lib32stdc++6 libbison-dev libc6-dev-armhf-cross libc6-i386 \
  libcrypto++-dev libdrm-dev libelf-dev libfdt-dev libfile-fcntllock-perl \
  libfl-dev libfuse-dev libgmp3-dev liblz4-tool python-is-python3 \
  libmpc-dev libncurses-dev libncurses5 libncurses5-dev libncursesw5-dev \
  libpython3-dev libsigsegv2 libssl-dev libtool libudev-dev \
  libusb-1.0-0-dev linux-base lld llvm locales lsb-release lz4 lzma lzop m4 \
  make mercurial minicom mtools ncurses-base ncurses-term net-tools \
  nfs-kernel-server ntpdate openssh-client openssh-server openssl p7zip \
  p7zip-full parallel parted patch patchutils pbzip2 perl pigz pixz \
  pkg-config pv python3 python3-dev \
  python3-distutils python3-pip python3-setuptools \
  qemu-user-static rar rdfind rename ripgrep rsync sed squashfs-tools \
  subversion sudo swig tar texinfo tree u-boot-tools udev unzip util-linux \
  uuid uuid-dev uuid-runtime vim wget whiptail xfsprogs xsltproc xxd \
  xz-utils zip zlib1g-dev zstd binwalk

if [ $? -ne 0 ]; then
  echo "install dependency failed"
  exit 1
fi

localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 || true
mkdir -p ${WORKDIR}/rockdev
mkdir -p ${WORKDIR}/release

#==========================================================================#
#                        build uboot                                       #
#==========================================================================#
cd ${WORKDIR}/

# skip uboot build, no official code found!

#==========================================================================#
#                        build kernel                                      #
#==========================================================================#
cd ${WORKDIR}

# skip kernel build, no official code found!

ls -alh ${WORKDIR}/release/
echo "Build completed successfully!"
exit 0
