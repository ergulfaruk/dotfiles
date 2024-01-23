#!/usr/bin/env bash
remote_files=$(ls -1 ~/.config/rofi/remote/)

if [ "$@" ]
then
  coproc ( bash ~/.config/rofi/remote/"$@" > /dev/null 2>&1 )
  exit 1;
else
  for remote_file_scripts in $remote_files
  do
    echo "$remote_file_scripts"
  done
fi
exit 0
