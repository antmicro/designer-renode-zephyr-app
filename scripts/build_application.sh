#!/bin/bash

mkdir -p artifacts

west build --pristine -b nrf52840dk_nrf52840 source/app
cp build/zephyr/zephyr.elf artifacts/software.elf
