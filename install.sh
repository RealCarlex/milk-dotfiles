sudo pacman -Syu
sudo pacman -S btop cava fastfetch gtk3 gtk4 hyprland kitty nwg-look qt5ct qt5-graphicaleffects qt5-quickcontrols2 qt5-declarative qt6ct qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg quickshell eww rofi amberol thunar gtkrc gtkrc-2 notify-send wl-clipboard cliphist libnotify powerprofilesctl grim slurp swww sddm tumbler qt5-wayland qt6-wayland file-roller brightnessctl gvfs eza xdg-desktop-portal-hyprland polkit-gnome ttf-bigblueterm-nerd hypridle hyprpm hyprland-qt-support hyprwayland-scanner hyprqt6engine xdg-desktop-portal xdg-desktop-portal-gtk pipewire pipewire-pulse wireplumber wiremix power-profiles-daemon upower pantheon-polkit-agent imagemagick bash git nano wget curl noto-fonts noto-fonts-cjk ttf-noto-emoji-monochrome ttf-noto-emoji base-devel fontconfig

cd
mkdir .config
mkdir .icons
mkdir .local
cd .local
mkdir bin
cd
mkdir .themes
sudo mkdir /boot/grub/themes
sudo mkdir /usr/share/sddm/themes
mkdir Pictures
cd milk-dotfiles

mv .config/* ~/.config/
mv .icons/* ~/.icons/
mv .local/bin/* ~/.local/bin/
mv .themes/* ~/.themes/
mv boot/grub/themes/MilkGrub /boot/grub/themes/
mv etc/* /etc/
mv usr/share/sddm/themes/* /usr/share/sddm/themes/
mv Pictures/* ~/Pictures/

hyprpm update
hyprpm add https://codeberg.org/zacoons/imgborders
hyprpm enable imgborders

sudo systemctl enable hypridle.service
sudo systemctl enable xdg-desktop-portal-hyprland.service
sudo systemctl enable quickshell.service

chmod +x ~/.local/bin/*

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

echo All Done! Reboot your system.
cd
rm -rf yay milk-dotfiles
