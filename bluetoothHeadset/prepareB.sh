#!/bin/bash

# set -eux -o pipefail

source blueCommon
source ../color_log.sh


echo "Checking..."
clr_blue "Bluetooth" -n;
clr_reset " is " -n;
clr_cyan ${IS_BLUETOOTH}
if [[ ${IS_BLUETOOTH} == 'inactive' ]]; then
    echo "Activating..."
    systemctl start bluetooth;
    sleep 1;
    IS_BLUETOOTH=$(isBluetooth);

    clr_blue "Bluetooth" -n;
    clr_reset " is " -n;
    clr_cyan ${IS_BLUETOOTH}
fi

clr_blue "Bluetooth" -n;
clr_reset " is " -n;
clr_cyan ${IS_BLOCKED}

if [[ ${IS_BLOCKED} == 'blocked' ]]; then
    echo "Unblocking..."
    rfkill unblock bluetooth;
    sleep 1;
    IS_BLOCKED=$(isBlocked);

    clr_blue "Bluetooth" -n;
    clr_reset " is " -n;
    clr_cyan ${IS_BLOCKED}

    sleep 6
fi


clr_reset "Powering on..." -n;
POWER=$(bluetoothctl power on)
if [[ ${POWER} == '1' ]]; then
  clr_red "Failed" -n;
  clr_reset " to power on bluetooth"
else
  clr_reset " succeeded"
fi


sleep 3

clr_reset "Connecting..." -n;
CONNECT=$(connectHeadset)

if [[ ${CONNECT} == '1' ]]; then
  clr_red "Failed" -n;
  clr_reset " to connect the headset ${HEADSET_MAC}"
  clr_green "Check" -n;
  clr_reset " a power of the headset!"
else
  clr_reset " succeeded"
fi
