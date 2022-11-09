#! /bin/zsh

project_root=$(dirname $(realpath $0))


pkexec brillo -I
brillo > $project_root/logs/login_backlight.log

