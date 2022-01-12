#!/bin/bash

# set -eux -o pipefail

source blueCommon

echo "Checking..."
echo "Bluetooth is ${IS_BLUETOOTH}"
IS_BLOCKED=$(isBlocked);
echo "Bluetooth is $IS_BLOCKED";

if [[ ${IS_BLUETOOTH} == "active" && ${IS_BLOCKED} == "unblocked" ]]; then
    echo "Powering off...";
    bluetoothctl power off;
    echo "Blockcing...";
    sleep 1;
    rfkill block bluetooth;
    IS_BLOCKED=$(isBlocked);
    echo "Bluetooth is ${IS_BLOCKED}"
fi



