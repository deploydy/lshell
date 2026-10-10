#!/bin/bash
set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info()  { echo -e "${BLUE}[INFO]${NC} $1"; }
log_ok()    { echo -e "${GREEN}[OK]${NC} $1"; }
log_error() { echo -e "${RED}[ERROR]${NC} $1"; }

if [ "$EUID" -eq 0 ]; then
    log_error "Do not run this script as root!"
    exit 1
fi

if ! command -v pacman &> /dev/null; then
    log_error "pacman not found. This script requires Arch Linux."
    exit 1
fi

if ! command -v yay &> /dev/null; then
    log_error "yay is not installed."
    exit 1
fi

log_info "Updating system..."
sudo pacman -Syyu --noconfirm
log_ok "System updated."

log_info "Installing pacman packages..."
sudo pacman -S --needed --noconfirm \
    git autotiling swaybg swaync waybar kitty rofi swaylock \
    papirus-icon-theme ttf-fira-code ttf-jetbrains-mono-nerd \
    ttf-nerd-fonts-symbols ttf-font-awesome noto-fonts-emoji \
    gsimplecal wtype rofi-emoji dolphin bluez bluez-utils blueman \
    nwg-displays fastfetch python python-pip nmap polkit-gnome \
    python-cryptography python-requests python-beautifulsoup4 \
    python-rich wl-clipboard
log_ok "Pacman packages installed."

log_info "Installing AUR packages..."
yay -S --needed --noconfirm waytrogen wlogout grim slurp
log_ok "AUR packages installed."

BUILD_DIR=$(mktemp -d)

log_info "Building scenefx0.5..."
cd "$BUILD_DIR"
git clone https://aur.archlinux.org/scenefx0.5.git
cd scenefx0.5
makepkg -si --noconfirm
log_ok "scenefx0.5 installed."

log_info "Building swayfx..."
cd "$BUILD_DIR"
git clone https://aur.archlinux.org/swayfx.git
cd swayfx
makepkg -si --noconfirm
log_ok "swayfx installed."

cd ~
rm -rf "$BUILD_DIR"

log_info "Generating fastfetch config..."
fastfetch --gen-config
log_ok "fastfetch config generated."

log_info "Removing old waybar config..."
rm -rf ~/.config/waybar/config.jsonc
log_ok "Old waybar config removed."

log_info "Cloning lshell..."
cd ~
rm -rf "$HOME/lshell"
git clone https://github.com/deploydy/lshell
log_ok "Repository cloned."

log_info "Copying configs..."
mkdir -p ~/.config
cp -r ~/lshell/* ~/.config/
log_ok "Configs copied."

rm -rf ~/lshell
log_ok "Temporary directory removed."

echo ""
echo -e "${GREEN}============================================${NC}"
echo -e "${GREEN}  Installation completed successfully!${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""

while true; do
    read -rp "Reboot the system now? [y/N]: " REBOOT_CHOICE
    case "$REBOOT_CHOICE" in
        [Yy]* )
            log_info "Rebooting system..."
            sudo reboot
            ;;
        [Nn]* | "" )
            log_info "Reboot skipped. Please reboot manually later."
            exit 0
            ;;
        * )
            echo "Please answer 'y' or 'n'."
            ;;
    esac
done
