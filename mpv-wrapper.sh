#!/usr/bin/bash

# Create the Pictures symlink as before
ln -snf "$(xdg-user-dir PICTURES)" "$HOME/.var/app/io.mpv.Mpv/Pictures"

exec mpv "$@"
