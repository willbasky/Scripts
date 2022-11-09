#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2
SCRIPTS_PATH=$(dirname $(dirname $(realpath $0)))
PROJECT_ROOT=$SCRIPTS_PATH/bluetoothHeadset

source $PROJECT_ROOT/blueCommon
source $SCRIPTS_PATH/color_log.sh

debug() {
  debug3 "$ARG1" "$ARG2" "$1"
}

debug "checking..."
IS_BLUETOOTH=$(isBluetooth)
debug "Bluetooth is ${IS_BLUETOOTH}"
IS_BLOCKED=$(isBlocked)
debug "Bluetooth is ${IS_BLOCKED}"

if [[ ${IS_BLUETOOTH} == "active" && ${IS_BLOCKED} == "unblocked" ]]; then
    powerOff
    deactvateBluetooth
    blockBluetooth

elif [[ ${IS_BLUETOOTH} == "active" && ${IS_BLOCKED} == "blocked" ]]; then
    deactvateBluetooth

else
  clr_reset "Bluetooth" -n;
  clr_blue " already turned off"

fi



