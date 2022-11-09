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

debug "init..."

if [[ $1 = "on" ]]; then
  debug "on"
  $PROJECT_ROOT/prepareB.sh "$ARG1" "$ARG2"
elif [[ $1 = "off" ]]; then
  debug "off"
  $PROJECT_ROOT/stopB.sh "$ARG1" "$ARG2"
else
  clr_red "Provide on/off argument"
fi
