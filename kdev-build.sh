#!/bin/bash
#

set -ex

rm -f arch/arm/dts/rk3568-evb.dtb
./make.sh rk3568


dtc -I dtb -O dts arch/arm/dts/rk3568-evb.dtb -o rk3568-uboot.dts
fdtdump u-boot.dtb > u-boot.dts
ls -alh rk3568-uboot.dts u-boot.dts

./make.sh loader
ls -alh rk356*.bin
echo "All ok! All done!"
