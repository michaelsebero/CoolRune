#!/bin/sh

su -c '
# RETRY LOGIC
retry_pacman() {
  local -r -i max_attempts="$1"
  local -r command="${@:2}"
  local -i attempt_num=1

  until $command
  do
    if (( attempt_num == max_attempts ))
    then
      echo "Attempt $attempt_num failed! No more retries left." >&2
      return 1
    else
      echo "Attempt $attempt_num failed! Retrying in 5 seconds..." >&2
      sleep 5
      attempt_num=$(( attempt_num + 1 ))
    fi
  done
}

# COOLRUNE CHOICE SELECTION
echo "Select a CoolRune Variant"
echo "1. CoolRune-AMD"
echo "2. CoolRune-INTEL"
echo "3. CoolRune-NVIDIA-OPENSOURCE"
echo "4. CoolRune-NVIDIA-PROPRIETARY"

read -p "Enter your choice (1, 2, 3 or 4): " choice

### AMD CHOICE ###
if [ "$choice" = "1" ]; then

# FIRST COMMANDS AND COOLRUNE IMPORT
killall xfce4-screensaver && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm --needed p7zip git && mkdir /home/coolrune-files && git clone https://github.com/michaelsebero/CoolRune /home/coolrune-files && cd /home/coolrune-files/files/coolrune-packages && 7z e coolrune-pacman-1.7z -o/etc -y && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm artix-archlinux-support && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && pacman-key --lsign-key 3056513887B78AEB && retry_pacman 5 pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && 7z e coolrune-pacman-2.7z -o/etc -y && chmod 755 /etc/pacman.conf && pacman-key --populate archlinux artix && retry_pacman 5 retry_pacman 5 pacman -Syyu --noconfirm --needed && mv /home/coolrune-files/files/coolrune-manual/Manual /home/$USER/Desktop &&

# REPO PACKAGES REMOVE
pacman -Rdd --noconfirm linux linux-headers pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf epiphany xfce4-terminal xfce4-screenshooter parole xfce4-taskmanager mousepad leafpad xfburn ristretto xfce4-appfinder atril artix-branding-base artix-grub-theme xfce4-sensors-plugin xfce4-notes-plugin mpv vulkan-intel && 

# REPO PACKAGES INSTALL
retry_pacman 5 pacman -S --noconfirm --needed --ignore=vlc,vlc-git lib32-artix-archlinux-support base-devel flatpak kate librewolf python-pip tmux jdownloader2 vulkan-icd-loader lib32-vulkan-icd-loader liferea ksnip kcalc font-manager gwenview gimp gamemode lib32-gamemode fail2ban fail2ban-s6 okular dnscrypt-proxy dnscrypt-proxy-s6 apparmor apparmor-s6 bleachbit blueman bluez-s6 konsole catfish clamav clamav-s6 ark gufw mugshot macchanger networkmanager networkmanager-s6 nm-connection-editor wine-ge-custom wine-mono winetricks ufw-s6 qbittorrent redshift steam lynis sneedacity element-desktop rkhunter paru proton-ge-custom lib32-mesa lib32-mesa-utils bottles appimagelauncher opendoas linux-cachyos linux-cachyos-headers mate-system-monitor lightdm-gtk-greeter-settings downgrade libreoffice pipewire-pulse pipewire-alsa wireplumber wine-gecko rust python-psutil python-dateutil python-xlib python-pyaudio python-pipenv usbguard usbguard-s6 hunspell-en_us vkbasalt lib32-vkbasalt chkrootkit python-matplotlib python-tqdm python-pillow python-mutagen wget noto-fonts-emoji xfce4-panel-profiles poetry tauon-music-box yt-dlp pyenv lxsession freetube python-magic python-piexif alsa-utils lib32-vulkan-radeon realtime-privileges expect &&

# FLATPAK PACKAGES
flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo && flatpak install -y org.gnome.seahorse.Application/x86_64/stable org.kde.haruna &&

# COOLRUNE INSTALL
7z x coolrune-root.7z -o/ -y && chattr +i /etc/hosts && s6-service add default apparmor && s6-service add default fail2ban && s6-service add default NetworkManager && s6-service add default dnscrypt-proxy && s6-service add default ufw && rm /etc/s6/adminsv/default/contents.d/connmand && pacman -R --noconfirm connman-s6 connman connman-g&& s6-db-reload && grub-mkconfig -o /boot/grub/grub.cfg && 7z x coolrune-dotfiles.7z -o/home/$USER -y &&

# RESETTING PERMISSIONS
chmod 777 /home/$USER/.librewolf -R &&
chmod 777 /home/$USER/.config -R &&
chmod 777 /home/$USER/Desktop/Manual &&
chmod 777 /home/$USER/.local/share/applications -R &&
chmod 777 /home/$USER/.local/share/konsole -R &&
chmod 777 /home/$USER/.local/share/xfce4-panel-profile -R &&
chmod 777 /home/$USER/.var -R &&

# PYTHON PACKAGES
pip3 install pydub imagehash pyzipper sounddevice tinytag eyed3 futures audioread librosa moviepy brotli websockets --user --break-system-packages --no-warn-script-location

# HARDENING SCRIPT
cd /-CoolRune-/Programs/Hardening-Script && sh hardening-script.sh && cd &&

# LAST COMMANDS
mv /etc/profile{,.old} && grub-install && update-grub && rm -rf /home/coolrune-files && echo "CoolRune has been successfully installed." && reboot



### INTEL CHOICE ###
elif [ "$choice" = "2" ]; then

# FIRST COMMANDS AND COOLRUNE IMPORT
killall xfce4-screensaver && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm --needed p7zip git && mkdir /home/coolrune-files && git clone https://github.com/michaelsebero/CoolRune /home/coolrune-files && cd /home/coolrune-files/files/coolrune-packages && 7z e coolrune-pacman-1.7z -o/etc -y && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm artix-archlinux-support && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && pacman-key --lsign-key 3056513887B78AEB && retry_pacman 5 pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && 7z e coolrune-pacman-2.7z -o/etc -y && chmod 755 /etc/pacman.conf && pacman-key --populate archlinux artix && retry_pacman 5 retry_pacman 5 pacman -Syyu --noconfirm --needed && mv /home/coolrune-files/files/coolrune-manual/Manual /home/$USER/Desktop &&

# REPO PACKAGES REMOVE
pacman -Rdd --noconfirm linux linux-headers pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf epiphany xfce4-terminal xfce4-screenshooter parole xfce4-taskmanager mousepad leafpad xfburn ristretto xfce4-appfinder atril artix-branding-base artix-grub-theme xfce4-sensors-plugin xfce4-notes-plugin mpv vulkan-radeon && 

# REPO PACKAGES INSTALL
retry_pacman 5 pacman -S --noconfirm --needed --ignore=vlc,vlc-git lib32-artix-archlinux-support base-devel flatpak kate librewolf python-pip tmux jdownloader2 vulkan-icd-loader lib32-vulkan-icd-loader liferea ksnip kcalc font-manager gwenview gimp gamemode lib32-gamemode fail2ban fail2ban-s6 okular dnscrypt-proxy dnscrypt-proxy-s6 apparmor apparmor-s6 bleachbit blueman bluez-s6 konsole catfish clamav clamav-s6 ark gufw mugshot macchanger networkmanager networkmanager-s6 nm-connection-editor wine-ge-custom wine-mono winetricks ufw-s6 qbittorrent redshift steam lynis sneedacity element-desktop rkhunter paru proton-ge-custom lib32-mesa lib32-mesa-utils bottles appimagelauncher opendoas linux-cachyos linux-cachyos-headers mate-system-monitor lightdm-gtk-greeter-settings downgrade libreoffice pipewire-pulse pipewire-alsa wireplumber wine-gecko rust python-psutil python-dateutil python-xlib python-pyaudio python-pipenv usbguard usbguard-s6 hunspell-en_us vkbasalt lib32-vkbasalt chkrootkit python-matplotlib python-tqdm python-pillow python-mutagen wget noto-fonts-emoji xfce4-panel-profiles poetry tauon-music-box yt-dlp pyenv lxsession freetube python-magic python-piexif alsa-utils intel-media-driver lib32-vulkan-intel realtime-privileges expect &&

# FLATPAK PACKAGES
flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo && flatpak install -y org.gnome.seahorse.Application/x86_64/stable org.kde.haruna &&

# COOLRUNE INSTALL
7z x coolrune-root.7z -o/ -y && chattr +i /etc/hosts && s6-service add default apparmor && s6-service add default fail2ban && s6-service add default NetworkManager && s6-service add default dnscrypt-proxy && s6-service add default ufw && rm /etc/s6/adminsv/default/contents.d/connmand && pacman -R --noconfirm connman-s6 connman connman-g&& s6-db-reload && grub-mkconfig -o /boot/grub/grub.cfg && 7z x coolrune-dotfiles.7z -o/home/$USER -y &&

# RESETTING PERMISSIONS
chmod 777 /home/$USER/.librewolf -R &&
chmod 777 /home/$USER/.config -R &&
chmod 777 /home/$USER/Desktop/Manual &&
chmod 777 /home/$USER/.local/share/applications -R &&
chmod 777 /home/$USER/.local/share/konsole -R &&
chmod 777 /home/$USER/.local/share/xfce4-panel-profile -R &&
chmod 777 /home/$USER/.var -R &&

# PYTHON PACKAGES
pip3 install pydub imagehash pyzipper sounddevice tinytag eyed3 futures audioread librosa moviepy brotli websockets --user --break-system-packages --no-warn-script-location

# HARDENING SCRIPT
cd /-CoolRune-/Programs/Hardening-Script && sh hardening-script.sh && cd &&

# LAST COMMANDS
mv /etc/profile{,.old} && grub-install && update-grub && rm -rf /home/coolrune-files && echo "CoolRune has been successfully installed." && reboot



### NVIDIA OPENSOURCE CHOICE ###
elif [ "$choice" = "3" ]; then

# FIRST COMMANDS AND COOLRUNE IMPORT
killall xfce4-screensaver && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm --needed p7zip git && mkdir /home/coolrune-files && git clone https://github.com/michaelsebero/CoolRune /home/coolrune-files && cd /home/coolrune-files/files/coolrune-packages && 7z e coolrune-pacman-1.7z -o/etc -y && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm artix-archlinux-support && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && pacman-key --lsign-key 3056513887B78AEB && retry_pacman 5 pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && 7z e coolrune-pacman-2.7z -o/etc -y && chmod 755 /etc/pacman.conf && pacman-key --populate archlinux artix && retry_pacman 5 retry_pacman 5 pacman -Syyu --noconfirm --needed && mv /home/coolrune-files/files/coolrune-manual/Manual /home/$USER/Desktop &&

# REPO PACKAGES REMOVE
pacman -Rdd --noconfirm linux linux-headers pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf epiphany xfce4-terminal xfce4-screenshooter parole xfce4-taskmanager mousepad leafpad xfburn ristretto xfce4-appfinder atril artix-branding-base artix-grub-theme xfce4-sensors-plugin xfce4-notes-plugin mpv && 

# REPO PACKAGES INSTALL
retry_pacman 5 pacman -S --noconfirm --needed --ignore=nvidia-390xx-utils,lib32-nvidia-390xx-utils,vlc,vlc-git lib32-artix-archlinux-support base-devel flatpak kate librewolf python-pip tmux jdownloader2 vulkan-icd-loader lib32-vulkan-icd-loader liferea ksnip kcalc font-manager gwenview gimp gamemode lib32-gamemode fail2ban fail2ban-s6 okular dnscrypt-proxy dnscrypt-proxy-s6 apparmor apparmor-s6 bleachbit blueman bluez-s6 konsole catfish clamav clamav-s6 ark gufw mugshot macchanger networkmanager networkmanager-s6 nm-connection-editor wine-ge-custom wine-mono winetricks ufw-s6 qbittorrent redshift steam lynis sneedacity element-desktop rkhunter paru proton-ge-custom nvidia-open-dkms nvidia-utils nvidia-utils-s6 lib32-nvidia-utils nvidia-settings bottles appimagelauncher opendoas linux-cachyos linux-cachyos-headers mate-system-monitor lightdm-gtk-greeter-settings downgrade libreoffice pipewire-pulse pipewire-alsa wireplumber wine-gecko rust python-psutil python-dateutil python-xlib python-pyaudio python-pipenv usbguard usbguard-s6 hunspell-en_us vkbasalt lib32-vkbasalt chkrootkit python-matplotlib python-tqdm python-pillow python-mutagen wget noto-fonts-emoji xfce4-panel-profiles poetry tauon-music-box yt-dlp pyenv lxsession freetube python-magic python-piexif alsa-utils realtime-privileges expect &&

# FLATPAK PACKAGES
flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo && flatpak install -y org.gnome.seahorse.Application/x86_64/stable org.kde.haruna com.leinardi.gwe &&

# COOLRUNE INSTALL
7z x coolrune-root.7z -o/ -y && 7z x coolrune-nvidia-patch.7z -o/ -y && chattr +i /etc/hosts && s6-service add default apparmor && s6-service add default fail2ban && s6-service add default NetworkManager && s6-service add default dnscrypt-proxy && s6-service add default ufw && rm /etc/s6/adminsv/default/contents.d/connmand && pacman -R --noconfirm connman-s6 connman connman-g&& s6-db-reload && grub-mkconfig -o /boot/grub/grub.cfg && 7z x coolrune-dotfiles.7z -o/home/$USER -y &&

# RESETTING PERMISSIONS
chmod 777 /home/$USER/.librewolf -R &&
chmod 777 /home/$USER/.config -R &&
chmod 777 /home/$USER/Desktop/Manual &&
chmod 777 /home/$USER/.local/share/applications -R &&
chmod 777 /home/$USER/.local/share/konsole -R &&
chmod 777 /home/$USER/.local/share/xfce4-panel-profile -R &&
chmod 777 /home/$USER/.var -R &&

# PYTHON PACKAGES
pip3 install pydub imagehash pyzipper sounddevice tinytag eyed3 futures audioread librosa moviepy brotli websockets --user --break-system-packages --no-warn-script-location

# HARDENING SCRIPT
cd /-CoolRune-/Programs/Hardening-Script && sh hardening-script.sh && cd &&

# LAST COMMANDS
mv /etc/profile{,.old} && grub-install && update-grub && rm -rf /home/coolrune-files && echo "CoolRune has been successfully installed." && reboot



### NVIDIA PROPRIETARY CHOICE ###
elif [ "$choice" = "4" ]; then

# FIRST COMMANDS AND COOLRUNE IMPORT
killall xfce4-screensaver && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm --needed p7zip git && mkdir /home/coolrune-files && git clone https://github.com/michaelsebero/CoolRune /home/coolrune-files && cd /home/coolrune-files/files/coolrune-packages && 7z e coolrune-pacman-1.7z -o/etc -y && retry_pacman 5 retry_pacman 5 pacman -Sy --noconfirm artix-archlinux-support && pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && pacman-key --lsign-key 3056513887B78AEB && retry_pacman 5 pacman -U --noconfirm 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' && 7z e coolrune-pacman-2.7z -o/etc -y && chmod 755 /etc/pacman.conf && pacman-key --populate archlinux artix && retry_pacman 5 retry_pacman 5 pacman -Syyu --noconfirm --needed && mv /home/coolrune-files/files/coolrune-manual/Manual /home/$USER/Desktop &&

# REPO PACKAGES REMOVE
pacman -Rdd --noconfirm linux linux-headers pulseaudio pulseaudio-alsa pulseaudio-bluetooth pulseaudio-zeroconf epiphany xfce4-terminal xfce4-screenshooter parole xfce4-taskmanager mousepad leafpad xfburn ristretto xfce4-appfinder atril artix-branding-base artix-grub-theme xfce4-sensors-plugin xfce4-notes-plugin mpv && 

# REPO PACKAGES INSTALL
retry_pacman 5 pacman -S --noconfirm --needed --ignore=nvidia-390xx-utils,lib32-nvidia-390xx-utils,vlc lib32-artix-archlinux-support base-devel flatpak kate librewolf python-pip tmux jdownloader2 vulkan-icd-loader lib32-vulkan-icd-loader liferea ksnip kcalc font-manager gwenview gimp gamemode lib32-gamemode fail2ban fail2ban-s6 okular dnscrypt-proxy dnscrypt-proxy-s6 apparmor apparmor-s6 bleachbit blueman bluez-s6 konsole catfish clamav clamav-s6 ark gufw mugshot macchanger networkmanager networkmanager-s6 nm-connection-editor wine-ge-custom wine-mono winetricks ufw-s6 qbittorrent redshift steam lynis sneedacity element-desktop rkhunter paru proton-ge-custom nvidia-dkms nvidia-utils nvidia-utils-s6 lib32-nvidia-utils nvidia-settings bottles appimagelauncher opendoas linux-cachyos linux-cachyos-headers mate-system-monitor lightdm-gtk-greeter-settings downgrade libreoffice pipewire-pulse pipewire-alsa wireplumber wine-gecko rust python-psutil python-dateutil python-xlib python-pyaudio python-pipenv usbguard usbguard-s6 hunspell-en_us vkbasalt lib32-vkbasalt chkrootkit python-matplotlib python-tqdm python-pillow python-mutagen wget noto-fonts-emoji xfce4-panel-profiles poetry tauon-music-box yt-dlp pyenv lxsession freetube python-magic python-piexif alsa-utils realtime-privileges expect &&

# FLATPAK PACKAGES
flatpak remote-add flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo && flatpak install -y org.gnome.seahorse.Application/x86_64/stable org.kde.haruna com.leinardi.gwe &&

# COOLRUNE INSTALL
7z x coolrune-root.7z -o/ -y && 7z x coolrune-nvidia-patch.7z -o/ -y && chattr +i /etc/hosts && s6-service add default apparmor && s6-service add default fail2ban && s6-service add default NetworkManager && s6-service add default dnscrypt-proxy && s6-service add default ufw && rm /etc/s6/adminsv/default/contents.d/connmand && pacman -R --noconfirm connman-s6 connman connman-g&& s6-db-reload && grub-mkconfig -o /boot/grub/grub.cfg && 7z x coolrune-dotfiles.7z -o/home/$USER -y &&

# RESETTING PERMISSIONS
chmod 777 /home/$USER/.librewolf -R &&
chmod 777 /home/$USER/.config -R &&
chmod 777 /home/$USER/Desktop/Manual &&
chmod 777 /home/$USER/.local/share/applications -R &&
chmod 777 /home/$USER/.local/share/konsole -R &&
chmod 777 /home/$USER/.local/share/xfce4-panel-profile -R &&
chmod 777 /home/$USER/.var -R &&

# PYTHON PACKAGES
pip3 install pydub imagehash pyzipper sounddevice tinytag eyed3 futures audioread librosa moviepy brotli websockets --user --break-system-packages --no-warn-script-location

# HARDENING SCRIPT
cd /-CoolRune-/Programs/Hardening-Script && sh hardening-script.sh && cd &&

# LAST COMMANDS
mv /etc/profile{,.old} && grub-install && update-grub && rm -rf /home/coolrune-files && echo "CoolRune has been successfully installed." && reboot
fi
'
