#!/bin/bash

# set -eux -o pipefail

source blueCommon

echo "Checking..."
echo "Bluetooth is ${IS_BLUETOOTH}"
if [[ ${IS_BLUETOOTH} == 'inactive' ]]; then
    echo "Activating..."
    systemctl start bluetooth;
    sleep 1;
    IS_BLUETOOTH=$(isBluetooth);
    echo "Bluetooth is ${IS_BLUETOOTH}";
fi

IS_BLOCKED=$(isBlocked)
echo "Bluetooth is ${IS_BLOCKED}"

if [[ ${IS_BLOCKED} == 'blocked' ]]; then
    echo "Unblocking..."
    rfkill unblock bluetooth;
    sleep 1;
    IS_BLOCKED=$(isBlocked);
    echo "Bluetooth is ${IS_BLOCKED}";
    sleep 6
fi


echo "Powering on..."
bluetoothctl power on

sleep 3

echo "Connecting..."
CONNECT=$(connectHeadset)

if [[ ${CONNECT} == '1' ]]; then
  echo "Failed to connect the headset ${HEADSET_MAC}"
  echo "Check a power of the headset!"
fi
