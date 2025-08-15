# Troubleshooting

## Quickshell fails to start
* Ensure `qs` or `quickshell` is installed and in `PATH`.
* Run `mycael-run` from a terminal to view logs in `~/.local/state/mycael/logs/mycael.log`.

## Theme does not change
* Verify `matugen` is installed and `mycael-matugen-apply` runs without errors (`~/.local/state/mycael/logs/matugen.log`).
* Check that your wallpaper path is correct and accessible.
* Ensure `systemctl --user status mycael-matugen.path` reports `active` if using automatic recolor.

## No Wayland session
`XDG_SESSION_TYPE` must be `wayland` and Hyprland must be running. Verify with `echo $XDG_SESSION_TYPE` and `hyprctl clients`.

## Missing icons or fonts
Install `material-symbols`, `ttf-cascadia-code-nerd`, `noto-fonts`, and `noto-fonts-emoji`.

## Clipboard or screenshot tools not working
Check that `wl-clipboard`, `grim` and `slurp` are installed. Re-run `./arch-port/scripts/check-deps.sh` to confirm.
