#!/bin/bash

THIS_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
ROOT_DIR="$(cd ${THIS_DIR}/.. && pwd)"

cd zephyrproject/zephyr

west build --pristine -b nrf52840dk_nrf52840 ${ROOT_DIR}/source
cp build/zephyr/zephyr.elf ${ROOT_DIR}/artifacts/software.elf
