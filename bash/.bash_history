reboot
btop
battop
sudo pacman -Syu battop
nmcli 
nmcli device show
nmcli wlan0 wifi connect "Belkin5GHZ" password wang3347
nmcli device wifi connect "Belkin5GHZ" password wang3347
ping google.com
sudo pacman -Syu battop
    sudo pacman -S base-devel git
sudo pacman -S yay
git clone https://aur.archlinux.org/cgit/aur.git/./yay
ls
ls -l
git clone https://aur.archlinux.org/yay.git 
 cd yay
cd yay
makepkg -si
sudo pacman -S --needed base-devel git
makepkg -si
cd
yay battop
yay battop
battop
pacman -S --needed   sof-firmware alsa-utils alsa-tools   mesa vulkan-intel intel-media-driver   grim slurp wl-clipboard pamixer   brightnessctl htop acpi   fwupd bluez bluez-utils fprintd
sudo pacman -S --needed   sof-firmware alsa-utils alsa-tools   mesa vulkan-intel intel-media-driver   grim slurp wl-clipboard pamixer   brightnessctl htop acpi   fwupd bluez bluez-utils fprintd
systemctl enable tlp
systemctl enable thermald
systemctl enable fstrim.timer
systemctl enable NetworkManager
sed -i 's/GRUB_CMDLINE_LINUX_DEFAULT="[^"]*/& intel_pstate=active i915.enable_psr=2 i915.enable_fbc=1 nmi_watchdog=0/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
sudo grub-mkconfig -o /boot/grub/grub.cfg
cat > /etc/systemd/system/fix-suspend.service << 'EOF'
[Unit]
Description=Fix X1 Nano suspend
Before=sleep.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c "echo 'RP01 S4 *disabled pci:0000:00:1c.0' >> /proc/acpi/wakeup"

[Install]
WantedBy=sleep.target
EOF

systemctl enable fix-suspend.service
systemctl enable fix-suspend.service
cat > /etc/systemd/system/fix-audio.service << 'EOF'
[Unit]
Description=Fix X1 Nano audio
After=sound.target

[Service]
Type=oneshot
ExecStart=/usr/bin/hda-verb /dev/snd/hwC0D0 0x1d SET_PIN_WIDGET_CONTROL 0x0

[Install]
WantedBy=multi-user.target
EOF

systemctl enable fix-audio.service
sudo cat > /etc/systemd/system/fix-audio.service << 'EOF'
[Unit]
Description=Fix X1 Nano audio
After=sound.target

[Service]
Type=oneshot
ExecStart=/usr/bin/hda-verb /dev/snd/hwC0D0 0x1d SET_PIN_WIDGET_CONTROL 0x0

[Install]
WantedBy=multi-user.target
EOF

systemctl enable fix-audio.service
yay -S zen-browser-bin
mkdir -p ~/.config/sway
cp /etc/sway/config ~/.config/sway/config
ls
ls -al
cd .config/
ls
cd sway/
ls
nvim config 
xdg-settings set default-web-browser zen-browser.desktop
nvim config 
cd
cd .config/
ls -al
mkdir alacritty
battop
battop
pacman -S zsh
sudo pacman -S zsh
cd sway/
nvim config 
nvim config 
battop
mkdir -p .config/gtk-3.0
nvim .config/gtk-3.0/settings.ini
battop
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-hack-nerd ttf-meslo-nerd
cd .config/alacritty/
nvim alacritty.toml
ls
zsh
zsh
ls
echo $SHELL
sudo pacman -S ttf-jetbrains-mono-nerd ttf-firacode-nerd ttf-hack-nerd ttf-meslo-nerd
reboot
