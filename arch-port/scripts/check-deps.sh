#!/usr/bin/env bash
# Verify runtime dependencies for Mycael
set -Eeuo pipefail
IFS=$'\n\t'

pass=true
check_bin() {
	local b="$1"
	shift
	if command -v "$b" >/dev/null 2>&1; then
		echo "Found: $b"
	else
		echo "Missing: $b $*"
		pass=false
	fi
}

echo "Checking required binaries..."
for bin in qs matugen hyprctl jq inotifywait wl-copy; do
	check_bin "$bin"
done

if command -v swww >/dev/null 2>&1; then
	echo "Found: swww"
elif command -v hyprctl >/dev/null 2>&1 && hyprctl hyprpaper list >/dev/null 2>&1; then
	echo "Found: hyprpaper"
else
	echo "Missing: swww or hyprpaper"
	pass=false
fi

for opt in playerctl grim slurp; do
	if command -v "$opt" >/dev/null 2>&1; then
		echo "Found optional: $opt"
	else
		echo "Optional missing: $opt"
	fi
done

if [[ ${XDG_SESSION_TYPE:-} != "wayland" ]]; then
	echo "Warning: not a Wayland session"
	pass=false
else
	echo "Wayland session detected"
fi

if $pass; then
	echo "All dependencies satisfied"
else
	cat <<PAC
Install missing packages with:
  sudo pacman -S --needed hyprland jq wl-clipboard inotify-tools swww grim slurp playerctl pipewire wireplumber noto-fonts noto-fonts-emoji
AUR (yay):
  yay -S quickshell-git matugen-bin
PAC
	exit 1
fi
