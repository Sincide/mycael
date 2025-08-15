#!/usr/bin/env bash
# Idempotent installer: links repo files into XDG paths
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd -P)"
CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
BACKUP_DIR="$STATE_HOME/mycael-backup-$(date +%s)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ "$(readlink -f "$dest" 2>/dev/null)" != "$src" ]]; then
      mkdir -p "$BACKUP_DIR"
      mv "$dest" "$BACKUP_DIR/"
      echo "Backed up $dest to $BACKUP_DIR";
    fi
  fi
  ln -sfn "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$REPO_ROOT/arch-port/.config/quickshell/mycael" "$CONFIG_HOME/quickshell/mycael"
link "$REPO_ROOT/arch-port/.config/hypr/mycael.conf" "$CONFIG_HOME/hypr/conf.d/mycael.conf"
link "$REPO_ROOT/arch-port/.config/systemd/user/mycael.service" "$CONFIG_HOME/systemd/user/mycael.service"
link "$REPO_ROOT/arch-port/.local/bin/mycael-run" "$HOME/.local/bin/mycael-run"
link "$REPO_ROOT/arch-port/.local/share/applications/mycael.desktop" "$HOME/.local/share/applications/mycael.desktop"

echo "Done. Backups stored in $BACKUP_DIR"
