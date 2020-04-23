#!/bin/bash

loadkeys trq

timedatectl set-ntp true

mkfs.ext4 /dev/sda1

mount /dev/sda1 /mnt

cp install2.sh /mnt

cp mirrorlist /etc/pacman.d

cp hosts /etc

pacstrap /mnt base linux linux-firmware linux-headers

genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt ./install2.sh