#!/bin/bash

initial_resolution="$(xrandr)"

while true; do
  current_resolution="$(xrandr)"

  if [[ "$current_resolution" != "$initial_resolution" ]]; then
      notify-send "Çözünürlük Değişti" "Yeni çözünürlük: $current_resolution"
      initial_resolution="$current_resolution"
      bspc wm -r
  fi

  sleep 5

done

