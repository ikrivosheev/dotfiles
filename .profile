#!/bin/sh

export XDG_RUNTIME_DIR=/run/user/$(id -u)/
# Rust
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
if [ -d "$CARGO_HOME" ]
then
    export PATH="$CARGO_HOME/bin:$PATH"
fi

eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

# Terminal
export TERMINAL="alacritty -e"

# Disable at spi2 service start
export NO_AT_BRIDGE=1

