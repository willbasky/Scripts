#! /bin/zsh

project_root=$(dirname $(realpath $0))

pkexec brillo -O
brillo > $project_root/logs/logout-backlight.log

