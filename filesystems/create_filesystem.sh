#!/usr/bin/env bash
: << 'EOC'
vgs
lvcreate -L 2 G -n new_logical_volume vol_group
mkfs.ext4 new_logical_volume
mkdir -p mount_dir
mount /dev/vol_group/new_logical_volume mount_dir
save in /etc/fstab

EOC
