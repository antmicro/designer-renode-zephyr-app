#!/bin/bash

THIS_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
ROOT_DIR="$(cd ${THIS_DIR}/.. && pwd)"

export PATH=$HOME/.local/bin:"$PATH"
export ZEPHYR_SDK_INSTALL_DIR=$(pwd)/${RENODE_ZEPHYR_SDK}

cd zephyrproject/zephyr

west build --pristine -b nrf52840dk_nrf52840 ${ROOT_DIR}/source
cp build/zephyr/zephyr.elf ${ROOT_DIR}/artifacts/software.elf
