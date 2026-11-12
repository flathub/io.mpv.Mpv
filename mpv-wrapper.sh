#!/usr/bin/bash

# create the Pictures symlink
xdg_pictures=$(xdg-user-dir PICTURES)
link=$HOME/.var/app/io.mpv.Mpv/Pictures

# only (re-)create the symlink if it is missing or the pictures user directory has been changed
if [[ ! -e $link || $(readlink "$link") != "$xdg_pictures" ]]; then
	ln --symbolic --no-dereference --force "$xdg_pictures" "$link"
fi

exec mpv "$@"
