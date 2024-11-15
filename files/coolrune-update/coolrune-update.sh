#!/bin/sh
# License: GNU GPLv3

su -c '
# CLEANUP
cleanup() {
    rm -rf /home/coolrune-files
    exit 1
}
trap cleanup INT TERM ERR EXIT

# SCRIPT VOCABULARY / USER MODIFICATION SECTION
root_files="wget https://github.com/michaelsebero/CoolRune/raw/main/files/coolrune-packages/coolrune-root.7z"
nvidia_patch="wget https://github.com/michaelsebero/CoolRune/raw/main/files/coolrune-packages/coolrune-nvidia-patch.7z"

# COOLRUNE CHOICE SELECTION
echo "Make sure to backup your passwords and bookmarks before updating CoolRune"
echo "1. CoolRune-AMD/INTEL"
echo "2. CoolRune-NVIDIA"
read -p "Enter your choice (1 or 2): " choice

### AMD/INTEL CHOICE ###
if [ "$choice" = "1" ]; then
pacman -Syyu --noconfirm --needed && mkdir /home/coolrune-files && cd /home/coolrune-files && eval $root_files && chattr -i /etc/hosts && 7z x coolrune-root.7z -o/ -y && chattr +i /etc/hosts && rm -rf /home/coolrune-files && rm -rf /home/$USER/coolrune-update.sh && update-grub && reboot

### NVIDIA CHOICE ###
elif [ "$choice" = "2" ]; then
pacman -Syyu --noconfirm --needed && mkdir /home/coolrune-files && cd /home/coolrune-files && eval $root_files && eval $nvidia_patch && chattr -i /etc/hosts && 7z x coolrune-root.7z -o/ -y && 7z x coolrune-nvidia-patch.7z -o/ -y && chattr +i /etc/hosts && rm -rf /home/coolrune-files && rm -rf /home/$USER/coolrune-update.sh && update-grub && reboot
fi
'
