#!/bin/bash

THIS_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
ROOT_DIR="$(cd ${THIS_DIR}/.. && pwd)"

apt update && apt install -y wget
wget https://apt.kitware.com/kitware-archive.sh && bash kitware-archive.sh
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
apt install -y git cmake ninja-build gperf ccache dfu-util device-tree-compiler wget python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1
pip3 install west==${RENODE_WEST_VERSION}

wget --no-verbose https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${RENODE_ZEPHYR_SDK_VERSION}/${RENODE_ZEPHYR_SDK_FILENAME}
tar xf ${RENODE_ZEPHYR_SDK_FILENAME}
pushd ${RENODE_ZEPHYR_SDK}
./setup.sh -t all -c
popd

west init zephyrproject
pushd zephyrproject/zephyr
git checkout ${RENODE_ZEPHYR_VERSION}
west update
west zephyr-export
pip3 install -r scripts/requirements.txt
west config manifest.group-filter -- +ci,+optional
west update
popd
