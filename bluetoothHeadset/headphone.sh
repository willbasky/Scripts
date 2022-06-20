#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2
USER=$(whoami)

cd "/home/$USER/sources/scripts/bluetoothHeadset/" || exit

source ./blueCommon
source ../color_log.sh

debug() {
  debug3 "$ARG1" "$ARG2" "$1"
}

debug "init..."

if [[ $1 = "on" ]]; then
  debug "on"
  prepareB.sh "$ARG1" "$ARG2"
elif [[ $1 = "off" ]]; then
  debug "off"
  stopB.sh "$ARG1" "$ARG2"
else
  clr_red "Provide on/off argument"
fi
