#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2
USER=$(whoami)

cd "/home/$USER/sources/scripts/bluetoothHeadset/" || exit

source blueCommon
source ../color_log.sh

debug() {
  debug3 "$ARG1" "$ARG2" "$1"
}

if [[ $1 = "on" ]]; then
  debug "on"
  prepareB.sh "$ARG1" "$ARG2"
elif [[ $1 = "off" ]]; then
  debug "off"
  stopB.sh "$ARG1" "$ARG2"
elif [[ ${IS_CONNECTED} == "yes" ]]; then
  debug "yes"
  stopB.sh "$ARG1" "$ARG2"
elif [[ ${IS_CONNECTED} == "no" ]]; then
  debug "no"
  prepareB.sh "$ARG1" "$ARG2"
elif [[ ${IS_CONTROLLER} == "yes" ]]; then
  # Bluetooth is powered but a headset not connected.
  debug "controller powered on"
  prepareB.sh "$ARG1" "$ARG2"
elif [[ ${IS_BLUETOOTH} == "inactive" ]]; then
  debug "inactive"
  prepareB.sh "$ARG1" "$ARG2"
elif [[ ${IS_BLOCKED} == "blocked" ]]; then
  debug "blocked"
  prepareB.sh "$ARG1" "$ARG2"
else
  clr_red "Provide on/off argument"
fi
