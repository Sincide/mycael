# Mycael Shell – Arch Manual Install

This directory provides a manual, user-scope installation of the **Mycael** Quickshell desktop on Arch Linux and derivatives. No system-wide files or packaging are used.

## Dependencies

Install required packages before linking the configuration. Official packages can be installed with `pacman`:

```bash
sudo pacman -S --needed hyprland jq wl-clipboard grim slurp swappy dunst playerctl upower lm_sensors networkmanager bluez blueman pipewire wireplumber qt6-declarative libqalculate ttf-cascadia-code-nerd noto-fonts noto-fonts-emoji
```

AUR packages (using `yay` as an example):

```bash
yay -S quickshell-git app2unit material-symbols
```

## Installation

Clone the repo and run the dependency check:

```bash
git clone https://github.com/Sincide/mycael.git
cd mycael
./arch-port/scripts/check-deps.sh
```

### Mode 1 – symlink (recommended)

```bash
./arch-port/scripts/link.sh
```

### Mode 2 – manual copy

```bash
CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}"
mkdir -p "$CONFIG/quickshell"
cp -r arch-port/.config/quickshell/mycael "$CONFIG/quickshell/"
cp arch-port/.config/hypr/mycael.conf "$CONFIG/hypr/conf.d/"
cp arch-port/.config/systemd/user/mycael.service "$CONFIG/systemd/user/"
install -Dm755 arch-port/.local/bin/mycael-run "$HOME/.local/bin/mycael-run"
cp arch-port/.local/share/applications/mycael.desktop "$HOME/.local/share/applications/"
```

## Autostart

### systemd --user

```bash
systemctl --user daemon-reload
enable --now mycael.service
```

### Hyprland snippet
Add to `~/.config/hypr/conf.d/mycael.conf`:

```conf
exec-once = ~/.local/bin/mycael-run
```

## Updating / rollback

Pull latest changes and rerun `link.sh`. Backups of replaced files are stored in `~/.local/state/mycael-backup-*`.

## Smoke test

```bash
mycael-run &
```

Stop with `pkill -f mycael-run`.

## QA checklist
- Bar renders at top of screen
- Notifications appear and dismiss
- MPRIS controls (if playerctl present) respond
- Audio OSD changes with volume keys
- Wallpaper picker lists images from `~/Pictures/Wallpapers`
