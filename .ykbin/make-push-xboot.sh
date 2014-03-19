#!/bin/sh

# kernel toolchain
#export PATH=$PATH:$PWD/prebuilts/gcc/linux-x86/mips/mips-4.4.3/bin
#export CROSS_COMPILE=mips-linux-gnu-
export PATH=/home_bakup/ykli/work/jb20121022-nand/prebuilts/gcc/linux-x86/mips/mipsel-linux-android-4.6/bin:$PATH

if [ $# -eq 2 ]; then
echo 
echo "Make xboot-$1.img:"
echo 

make clean
make $2_config
make
if [ $1 = "msc" ]; then
    mv mbr-xboot.bin mbr-xboot-$2.bin
    yksmb push mbr-xboot-$2.bin
    echo "---------------------------------->"$PWD"/mbr-xboot-$2.bin"
fi
if [ $1 = "nand" ]; then
    mv x-boot-nand.bin x-boot-nand-$2.bin
    yksmb push x-boot-nand-$2.bin
    echo "---------------------------------->"$PWD"/x-boot-nand-$2.bin"
fi


echo 
echo 

else
echo "./make-push-xboot.sh msc/nand  config_name(warrior_nand)"
fi
