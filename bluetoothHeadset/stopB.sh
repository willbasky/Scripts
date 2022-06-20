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
debug "Bluetooth is ${IS_BLUETOOTH}"
IS_BLOCKED=$(isBlocked)
debug "Bluetooth is ${IS_BLOCKED}"

if [[ ${IS_BLUETOOTH} == "active" && ${IS_BLOCKED} == "unblocked" ]]; then
    clr_reset "Powering headset off..." -n;
    OFF=$(bluetoothctl power off);
    sleep 1;
    if [[ ${OFF} == '1' ]]; then
      clr_red " failed" -n;
      clr_reset " to power off bluetooth"
    else
      clr_blue " succeeded"
    fi

    clr_reset "Deactivating..." -n;
    DEACTIVED=$(systemctl stop bluetooth);
    sleep 1;
    if [[ ${DEACTIVED} == '1' ]]; then
      clr_red " failed" -n;
      clr_reset " to deactvate bluetooth service"
    else
      clr_blue " succeeded"
    fi
    IS_BLUETOOTH=$(isBluetooth);
    debug "Bluetooth service is ${IS_BLUETOOTH}"

    clr_reset "Blocking..." -n;
    KILL=$(rfkill block bluetooth);
    sleep 1;
    if [[ ${KILL} == '1' ]]; then
      clr_red " failed" -n;
      clr_reset " to block bluetooth"
    else
      clr_blue " succeeded"
    fi

    IS_BLOCKED=$(isBlocked);
    debug "Bluetooth is ${IS_BLOCKED}"
else
  clr_reset "Bluetooth" -n;
  clr_blue " already turned off"
fi



