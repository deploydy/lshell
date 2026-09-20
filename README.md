# lshell

Minimalist configuration for SwayFX (Wayland).

## Preview
<img width="2560" height="1600" alt="изображение" src="https://github.com/user-attachments/assets/ec46900a-3ed4-46b7-9eb9-164dc769630f" />
<img width="2560" height="1600" alt="изображение" src="https://github.com/user-attachments/assets/a3fc5641-e856-4e3b-8c51-85f3d0796fa2" />

## Wallpapers
<img width="3600" height="2000" alt="moon-black-background-space-planet-full-moon-3600x2000-2043" src="https://github.com/user-attachments/assets/7a45f092-5f38-4362-a7d1-54b412ec7cf1" />
<img width="3840" height="2160" alt="europa-jupiter-moon-3840x2160-26741" src="https://github.com/user-attachments/assets/1e841bd2-adcc-4274-aa99-1a48383a1a97" />



## Components
| Component | Application | Notes |
| :--- | :--- | :--- |
| **Window Manager** | SwayFX | Blur & Radius enabled |
| **Bar** | Waybar | Custom CSS, MPRIS, & Pomodoro |
| **Terminal** | Kitty | Custom Theme |
| **Launcher** |	Rofi |	Run / Drun / Window modes
| **Compositor** | Native |	SwayFX handles composition

### Key Bindings

<details>
<summary>Click to view full keybindings list</summary>



| Keybind | Action | Command |
| :--- | :--- | :--- |
| **Applications** | | |
| `Mod` + `m` | Passwords Manager | `kitty python3 $HOME/.config/passwords.py` |
| `Mod` + `h` | Network Scan | `kitty python3 $HOME/.config/netscan.py` |
| `Mod` + `s` | Config Settings | `kitty python3 $HOME/.config/lshell.py` |
| `Mod` + `p` | Notifications Launcher | `swaync-client -t -sw` |
| `Mod` + `Enter` | Open Terminal | `$term (Kitty)` |
| `Mod` + `d` | App Launcher | `rofi -show drun` |
| `Mod` + `c` | Crypto Monitor | `kitty python3 $HOME/.config/cryptosee.py` |
| `Mod` + `b` | Browser | `firefox` |
| `Mod` + `n` | File Manager | `dolphin` |
| `Mod` + `w` | Wallpaper Manager | `waytrogen` |
| `Mod` + `.` | Emoji Launcher | `rofi -show emoji` |
| `Mod` + `shift` + `e` | Logout Manager | `wlogout` |
| **Navigation & Workspaces** | | |
| `Mod` + `Tab` | Visual Window List | `rofi -show window` |
| **System** | | |
| `Mod` + `q` | Kill Focused Window | `kill` |
| `Mod` + `Shift` + `x` | Lock Screen | `swaylock` |
| `Mod` + `Shift` + `c` | Reload Configuration | `reload` |
| `Mod` + `Shift` + `e` | Exit Sway | `swaynag` |
| **Screenshots** | | |
| `Mod` + `Shift` + `s` | Region Screenshot | `grim + slurp` |
| `Print` | Full Screenshot | `grim` |
| **Window Management** | | |
| `Mod` + `Shift` + `Space` | Toggle Floating | `floating toggle` |
| `Mod` + `Shift` + `Minus` | Scratchpad (Move) | `move scratchpad` |
| **Hardware / Media** | | |
| `Vol Up/Down/Mute` | Audio Control | `pactl` |
| `Play/Next/Prev` | Media Control | `playerctl` |


</details>

# Install
## Arch Linux
```bash
sudo pacman -Syyu
sudo pacman -S git autotiling swaybg swaync waybar kitty rofi swaylock papirus-icon-theme ttf-fira-code ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols ttf-font-awesome noto-fonts-emoji gsimplecal wtype rofi-emoji dolphin bluez bluez-utils blueman nwg-displays fastfetch python python-pip nmap polkit-gnome python-cryptography python-requests python-beautifulsoup4 python-rich
yay -S waytrogen wlogout swayfx
fastfetch --gen-config
rm -rf ~/.config/waybar/config.jsonc
cd ~
git clone https://github.com/deploydy/lshell
cp -r ~/lshell/* ~/.config/
rm -rf ~/lshell
```

# System Requirements
** OS: Arch Linux (Arch-based)

** GPU: Intel, AMD, or Nvidia with native Wayland support

** RAM: 2 GB minimum (4 GB recommended)

** CPU: Any modern dual-core processor

** Storage: 32 GB or more for comfortable system use

# Once installed, do this
Press Win + S and Click and select the panel position and your city.
