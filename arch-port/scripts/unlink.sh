#!/usr/bin/env bash
# Remove links created by link.sh
set -Eeuo pipefail
IFS=$'\n\t'

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ARCH_ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"

remove_one() {
	local src="$ARCH_ROOT/$1" dest="$HOME/$1"
	if [[ -L $dest && "$(readlink -f "$dest")" == "$src" ]]; then
		rm "$dest"
		echo "Removed $dest"
	else
		echo "Skipping $dest"
	fi
}

remove_one .config/quickshell/mycael
remove_one .config/hypr/conf.d/mycael.conf
remove_one .config/systemd/user/mycael.service
remove_one .config/systemd/user/mycael-matugen.service
remove_one .config/systemd/user/mycael-matugen.path
remove_one .config/systemd/user/mycael-matugen@.service
remove_one .config/matugen
remove_one .local/bin/mycael-run
remove_one .local/bin/mycael-matugen-apply
remove_one .local/bin/mycael-wallpaper-set
remove_one .local/share/applications/mycael.desktop
