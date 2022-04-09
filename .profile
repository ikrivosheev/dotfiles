#!/bin/sh

# Rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
if [ -d "$CARGO_HOME" ]
then
    export PATH="$CARGO_HOME/bin:$PATH"
fi

export $(gnome-keyring-daemon —start —components=pkcs11,secrets,ssh,gpg)

# Terminal
export TERMINAL="alacritty -e"

