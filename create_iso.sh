#!/bin/bash

$TARGET-as boot.s -o boot.o
$TARGET-g++ -c kernel.c++ -o kernel.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
$TARGET-gcc -T linker.ld -o isodir/boot/${1}.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
# cp ${1}.bin isodir/boot/${1}.bin
grub-mkrescue -o ${1}.iso isodir

