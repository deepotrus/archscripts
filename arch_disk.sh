#!/bin/bash

# Setup Disk (with UEFI!) in /dev/sda
# make sure to fdisk /dev/sda with following commands:
# p, g, n (last sector 500M), t 1(EFI partition), n, t 2 44 (LVM Linux), p, w

# Create Physical Volume, Volume Groups and Logical Volumes
pvcreate --dataalignment 1m /dev/sda2
vgcreate volgroup0 /dev/sda2
lvcreate -L 30GB volgroup0 -n lv_root
lvcreate -l 100%FREE volgroup0 -n lv_home
modprobe dm_mod
vgchange -ay

mkfs.ext4 /dev/volgroup0/lv_root
mount /dev/volgroup0/lv_root /mnt

mkfs.ext4 /dev/volgroup/lv_home
mkdir /mnt/home
mount /dev/volgroup0/lv_home /mnt/home

# Create fstab file (at boot time tells where to find partitions)
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab
