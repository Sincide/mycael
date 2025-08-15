# Migrating from Nix

The original project ships Nix flake definitions. To switch to this manual Arch layout:

1. Disable any Nix-provided services for Mycael.
2. Remove or rename `~/.config/quickshell/mycael` if it exists.
3. Clone this repository and run `./arch-port/scripts/link.sh`.
4. Enable autostart via systemd (`systemctl --user enable --now mycael.service mycael-matugen.path`) or Hyprland.
5. Matugen config now lives in `~/.config/matugen`; move any existing templates there.
6. Keep the Nix files if you plan to contribute upstream – they are untouched by this setup.
