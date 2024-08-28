#!/bin/bash

THIS_DIR="$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)"
ROOT_DIR="$(cd ${THIS_DIR}/.. && pwd)"

mkdir -p artifacts
cd zephyr

west build --pristine -b nrf52840dk_nrf52840 samples/subsys/shell/shell_module
cp build/zephyr/zephyr.elf ${ROOT_DIR}/artifacts/software.elf
