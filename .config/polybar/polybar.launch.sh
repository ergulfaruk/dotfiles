#!/usr/bin/env sh
# Terminate already running bar instances
killall -q polybar
# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done
# Launch: 'top' is the name of my Polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload --config=~/.config/polybar/config.ini example &
  done
else
  polybar --reload --config=~/.config/polybar/config.ini example &
fi
