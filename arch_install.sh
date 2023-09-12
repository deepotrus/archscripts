#!/bin/bash

# Installing Arch, on chroot! Not usb media
# Before running the script, run:
# pacstrap -i /mnt base
# arch-chroot /mnt

# At this point distribution is installed but not the kernel
pacman -S linux linux-headers
pacman -S linux-lts linux-lts-headers
pacman -S vim
pacman -S base-devel openssh
pacman -S networkmanager wpa_supplicant wireless_tools netctl
pacman -S dialog
systemctl enable NetworkManager

pacman -S lvm2

# Now modify mkinitcpio.conf
# Then add users and password
