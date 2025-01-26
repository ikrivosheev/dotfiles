#!/bin/bash
set -e

lock() {
  dunstctl set-paused true
  swaylock \
  --daemonize \
	--screenshots \
	--clock \
	--indicator \
	--indicator-radius 100 \
	--indicator-thickness 7 \
	--effect-blur 7x5 \
	--effect-vignette 0.5:0.5 

  dunstctl set-paused toggle
}


case $1 in 
    lock)
        lock
        ;;
    logout)
        loginctl terminate-session $XDG_SESSION_ID
        ;;
    suspend)
        systemctl suspend-then-hibernate
        ;;
    hibernate)
        systemctl hibernate
        ;;
    reboot)
        systemctl reboot
        ;;
    shutdown)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|logout|suspend|hibernate|reboot|shutdown}"
        exit 1
esac

exit 0
