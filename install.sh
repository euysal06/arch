#!/bin/bash

loadkeys trq

timedatectl set-ntp true

mkfs.ext4 /dev/sda1

mount /dev/sda1 /mnt

cp install2.sh /mnt

cp mirrorlist /mnt/etc/pacman.d

cp hosts /mnt/etc

pacstrap /mnt base linux linux-firmware

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt ./install2.sh