#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

hwclock --systohc

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen

sed -i 's/#\(tr_TR\.UTF-8\)/\1/' /etc/locale.gen

locale-gen

echo "LANG=tr_TR.UTF-8" > /etc/locale.conf

echo "KEYMAP=trq" > /etc/vconsole.conf

echo "denk" > /etc/hostname

mkinitcpio -P

pacman -S --noconfirm grub os-prober efibootmgr

mkdir /boot/efi

mount /dev/sda2 /boot/efi

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Archlinux

grub-mkconfig -o /boot/grub/grub.cfg

pacman -S --noconfirm sudo nano networkmanager xorg

systemctl enable NetworkManager

useradd -m -p "" -g users -G "adm,audio,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /bin/bash euysal

exit
