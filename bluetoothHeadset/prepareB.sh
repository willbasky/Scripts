#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2

source ./blueCommon
source ../color_log.sh

debug() {
  debug3 "$ARG1" "$ARG2" "$1"
}

debug "checking..."

IS_BLUETOOTH=$(isBluetooth)
debug "Bluetooth service is ${IS_BLUETOOTH}"

if [[ ${IS_BLUETOOTH} == 'inactive' ]]; then
    debug "activating..."
    systemctl start bluetooth;
    sleep 1;
    IS_BLUETOOTH=$(isBluetooth);
    debug "Bluetooth service is ${IS_BLUETOOTH}"
fi

IS_BLOCKED=$(isBlocked)
debug "Bluetooth chip is ${IS_BLOCKED}"

if [[ ${IS_BLOCKED} == 'blocked' ]]; then
    debug "unblocking..."
    rfkill unblock bluetooth;
    sleep 1;
    IS_BLOCKED=$(isBlocked);

    debug "Bluetooth chip is ${IS_BLOCKED}"
    sleep 6
fi

clr_reset "Powering on..." -n;
POWER=$(bluetoothctl power on)
if [[ ${POWER} == '1' ]]; then
  clr_red " failed" -n;
  clr_reset " to power on bluetooth"
else
  clr_blue " succeeded"
fi


sleep 3

clr_reset "Connecting to headset..." -n;
CONNECT=$(connectHeadset)

if [[ ${CONNECT} == '1' ]]; then
  clr_red " failed";
  debug "Failed to connect to mac ${HEADSET_MAC}"
else
  clr_blue " succeeded"
fi
