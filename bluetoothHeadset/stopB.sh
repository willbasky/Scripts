#!/bin/bash

# set -eux -o pipefail

source blueCommon
source ../color_log.sh


echo "Checking..."
clr_blue "Bluetooth" -n;
clr_reset " is " -n;
clr_cyan ${IS_BLUETOOTH}

clr_blue "Bluetooth" -n;
clr_reset " is " -n;
clr_cyan ${IS_BLOCKED}

if [[ ${IS_BLUETOOTH} == "active" && ${IS_BLOCKED} == "unblocked" ]]; then
    clr_reset "Powering off..." -n;
    OFF=$(bluetoothctl power off);
    sleep 1;
    if [[ ${OFF} == '1' ]]; then
      clr_red "Failed" -n;
      clr_reset " to power off bluetooth"
    else
      clr_reset " succeeded"
    fi

    clr_reset "Blocking..." -n;
    KILL=$(rfkill block bluetooth);
    sleep 1;
    if [[ ${KILL} == '1' ]]; then
      clr_red "Failed" -n;
      clr_reset " to block bluetooth"
    else
      clr_reset " succeeded"
    fi

    IS_BLOCKED=$(isBlocked);
    clr_blue "Bluetooth" -n;
    clr_reset " is " -n;
    clr_cyan ${IS_BLOCKED}
fi



