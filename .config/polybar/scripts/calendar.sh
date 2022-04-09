#!/bin/bash

set -e

WIDTH=200
HEIGHT=200
    
i3-msg -q "exec yad --calendar \
    --width=$WIDTH --height=$HEIGHT \
    --undecorated --fixed \
    --close-on-unfocus --no-buttons --mouse \
    > /dev/null"


