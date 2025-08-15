# Mycael – Arch Linux Setup with Matugen

Mycael is a [Quickshell](https://github.com/quickshell-mirror/quickshell) desktop driven by Material You colors. This directory provides a user-scope install that works on Arch Linux and derivatives without any system packages or sudo (except for installing dependencies).

## Dependencies
Install runtime packages. Official repos:

```bash
sudo pacman -S --needed hyprland jq wl-clipboard inotify-tools swww grim slurp playerctl pipewire wireplumber noto-fonts noto-fonts-emoji
```

AUR (using `yay`):

```bash
yay -S quickshell-git matugen-bin ttf-cascadia-code-nerd material-symbols
```

## Install
```bash
git clone https://github.com/Sincide/mycael.git
cd mycael
./arch-port/scripts/check-deps.sh
./arch-port/scripts/link.sh
```

## Autostart
Enable systemd units:
```bash
systemctl --user daemon-reload
enable --now mycael.service mycael-matugen.path
```

Or for Hyprland without systemd, add to `~/.config/hypr/conf.d/mycael.conf`:
```conf
exec-once = ~/.local/bin/mycael-run
```

## Matugen workflow
```
Wallpaper ─▶ mycael-matugen-apply ─▶ matugen templates ─▶ colors-generated.js ─▶ colors-loader.qml ─▶ Quickshell reload
```
- `mycael-matugen-apply` detects the current wallpaper (swww or hyprpaper) and runs `matugen` with templates under `~/.config/matugen/templates`.
- Colors are written to `~/.config/quickshell/mycael/colors/colors-generated.js` atomically.
- `mycael` reloads to apply the new theme. If Matugen is missing, `colors-fallback.js` is used.

Change wallpaper and recolor:
```bash
mycael-wallpaper-set ~/Pictures/wall.jpg
```
This sets the wallpaper via `swww`/`hyprpaper` and triggers Matugen.

## Validation
1. Start shell: `mycael-run &`
2. Change wallpaper with `mycael-wallpaper-set` or your own tool.
3. Theme should update within a few seconds.

## Uninstall
Remove links:
```bash
./arch-port/scripts/unlink.sh
```

Backups of replaced files reside in `~/.local/state/mycael-backup-*`.

See `TROUBLESHOOTING.md` and `MIGRATION.md` for more help.
