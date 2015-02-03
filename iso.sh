#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/rybread.kernel isodir/boot/rybread.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "rybread" {
	multiboot /boot/rybread.kernel
}
EOF
grub-mkrescue -o rybread.iso isodir
