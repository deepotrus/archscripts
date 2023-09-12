#!/bin/bash

# Installing Arch, on chroot! Not usb media
# Before running the script, run:
# pacstrap -i /mnt base
# arch-chroot /mnt

# At this point distribution is installed but not the kernel
pacman -Sy linux linux-headers
pacman -Sy linux-lts linux-lts-headers
pacman -Sy vim
pacman -Sy base-devel openssh
systemctl enable sshd
pacman -Sy networkmanager wpa_supplicant wireless_tools netctl
pacman -Sy dialog
systemctl enable NetworkManager

pacman -Sy lvm2

# Now modify mkinitcpio.conf
# Then add users and password
