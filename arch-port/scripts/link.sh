#!/usr/bin/env bash
# Idempotently symlink Mycael files into \$HOME
set -Eeuo pipefail

SCRIPT_DIR="$(cd -- "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
ARCH_ROOT="$(cd "$SCRIPT_DIR/.." && pwd -P)"
STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
BACKUP_DIR="$STATE_HOME/mycael-backup-$(date +%s)"

link_one() {
  local rel="$1" src="$ARCH_ROOT/$1" dest="$HOME/$1"
  mkdir -p "$(dirname "$dest")"
  if [[ -e "$dest" && ! -L "$dest" ]]; then
    mkdir -p "$BACKUP_DIR/$(dirname "$rel")"
    mv "$dest" "$BACKUP_DIR/$rel"
    echo "Backup: $dest -> $BACKUP_DIR/$rel"
  fi
  ln -sfn "$src" "$dest"
  printf '%s -> %s\n' "$dest" "$src"
}

link_one .config/quickshell/mycael
link_one .config/hypr/conf.d/mycael.conf
link_one .config/systemd/user/mycael.service
link_one .config/systemd/user/mycael-matugen.service
link_one .config/systemd/user/mycael-matugen.path
link_one .config/systemd/user/mycael-matugen@.service
link_one .config/matugen
link_one .local/bin/mycael-run
link_one .local/bin/mycael-matugen-apply
link_one .local/bin/mycael-wallpaper-set
link_one .local/share/applications/mycael.desktop

echo "Links created. Backups stored in $BACKUP_DIR"
