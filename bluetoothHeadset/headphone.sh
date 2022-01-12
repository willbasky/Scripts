#!/bin/bash

# set -eux -o pipefail

USER=$(whoami)
cd "/home/$USER/sources/scripts/bluetoothHeadset/"

source blueCommon

if [[ $1 = "on" ]]; then
  echo "Case: on"
  prepareB.sh
elif [[ $1 = "off" ]]; then
  echo "Case: off"
  stopB.sh
elif [[ ${IS_CONNECTED} == "yes" ]]; then
  echo "Case: yes"
  stopB.sh
elif [[ ${IS_CONNECTED} == "no" ]]; then
  echo "Case: no"
  prepareB.sh
elif [[ ${IS_CONTROLLER} == "yes" ]]; then
  # Bluetooth is powered but a headset not connected.
  echo "Case: controller powered on"
  prepareB.sh
elif [[ ${IS_BLUETOOTH} == "inactive" ]]; then
  echo "Case: inactive"
  prepareB.sh
elif [[ ${IS_BLOCKED} == "blocked" ]]; then
  echo "Case: blocked"
  prepareB.sh
else
  echo "Provide on/off argument"
fi
