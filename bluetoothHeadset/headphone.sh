#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2
USER=$(whoami)

cd "/home/$USER/sources/scripts/bluetoothHeadset/" || exit

source blueCommon
source ../color_log.sh

debug() {
  if [[ ${ARG1} == "debug" || ${ARG2} == "debug" ]]; then
    local name="$1";
    clr_green "Debug: $name"
  fi
}

if [[ $1 = "on" ]]; then
  debug "on"
  prepareB.sh
elif [[ $1 = "off" ]]; then
  debug "off"
  stopB.sh
elif [[ ${IS_CONNECTED} == "yes" ]]; then
  debug "yes"
  stopB.sh
elif [[ ${IS_CONNECTED} == "no" ]]; then
  debug "no"
  prepareB.sh
elif [[ ${IS_CONTROLLER} == "yes" ]]; then
  # Bluetooth is powered but a headset not connected.
  debug "controller powered on"
  prepareB.sh
elif [[ ${IS_BLUETOOTH} == "inactive" ]]; then
  debug "inactive"
  prepareB.sh
elif [[ ${IS_BLOCKED} == "blocked" ]]; then
  debug "blocked"
  prepareB.sh
else
  clr_red "Provide on/off argument"
fi
