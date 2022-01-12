#!/bin/bash

# set -eux -o pipefail

ARG1=$1
ARG2=$2

source blueCommon
source ../color_log.sh

debug() {
  debug3 "$ARG1" "$ARG2" "$1"
}

debug "checking..."
debug "Bluetooth is ${IS_BLUETOOTH}"
if [[ ${IS_BLUETOOTH} == 'inactive' ]]; then
    debug "activating..."
    systemctl start bluetooth;
    sleep 1;
    IS_BLUETOOTH=$(isBluetooth);

    debug "Bluetooth is ${IS_BLUETOOTH}"
fi

debug "Bluetooth is ${IS_BLOCKED}"

if [[ ${IS_BLOCKED} == 'blocked' ]]; then
    debug "unblocking..."
    rfkill unblock bluetooth;
    sleep 1;
    IS_BLOCKED=$(isBlocked);

    debug "Bluetooth is ${IS_BLOCKED}"
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

clr_reset "Connecting..." -n;
CONNECT=$(connectHeadset)

if [[ ${CONNECT} == '1' ]]; then
  clr_red " failed";
  clr_blue "Check" -n;
  clr_reset " a power of the headset ${HEADSET_MAC}"
else
  clr_blue " succeeded"
fi
