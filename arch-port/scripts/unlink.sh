#!/usr/bin/env bash
# Remove links created by link.sh
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd -P)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

remove() {
  local dest="$1" src="$2"
  if [[ -L "$dest" && "$(readlink -f "$dest")" == "$src" ]]; then
    rm "$dest"
    echo "Removed $dest"
  else
    echo "Skipping $dest"
  fi
}

remove "$CONFIG_HOME/quickshell/mycael" "$REPO_ROOT/arch-port/.config/quickshell/mycael"
remove "$CONFIG_HOME/hypr/conf.d/mycael.conf" "$REPO_ROOT/arch-port/.config/hypr/mycael.conf"
remove "$CONFIG_HOME/systemd/user/mycael.service" "$REPO_ROOT/arch-port/.config/systemd/user/mycael.service"
remove "$HOME/.local/bin/mycael-run" "$REPO_ROOT/arch-port/.local/bin/mycael-run"
remove "$HOME/.local/share/applications/mycael.desktop" "$REPO_ROOT/arch-port/.local/share/applications/mycael.desktop"
