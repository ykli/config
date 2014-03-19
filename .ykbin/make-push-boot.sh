#!/bin/sh

# kernel toolchain
export PATH=/home_bakup/ykli/work/jb20121022-nand/prebuilts/gcc/linux-x86/mips/mipsel-linux-android-4.6/bin:$PATH
export CROSS_COMPILE=mipsel-linux-android-

if [ $# -eq 1 ]; then
echo 
echo "Make boot-$1.img:"
echo 

mkbootfs ./root-$1 | minigzip > ./ramdisk-$1.img
make zImage -j8
mkbootimg  --kernel arch/mips/boot/compressed/zImage --ramdisk ./ramdisk-$1.img --output ./boot-$1.img

yksmb push boot-$1.img

echo $PWD"/boot-$1.img"
echo 
echo 

else
echo "./make-push-boot.sh product_name"
fi
