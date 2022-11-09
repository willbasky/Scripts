#! /bin/bash

set -e

SCRIPTS_PATH=$(dirname $(realpath $0))

sleep 2

# bright is symbolic link for brightness.sh
$SCRIPTS_PATH/brightness.sh 0.6 5000
