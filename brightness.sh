#!/bin/bash

# set -eux -o pipefail

## Check brightness parameter
check_brightness=$(echo "$1 >= 0.2 && $1 <= 1" | bc)
## Check temprature parameter
check_temprature=$(echo "$2 >= 1000 && $2 <= 25000" | bc)

# echo "${check_brightness}"
# echo "${check_temprature}"

if (( $# == 2 )) # check number of arguments
then if (( check_brightness && check_temprature ))
  then
    redshift -P -b "$1" -O "$2K" -m randr
  else
    echo "Expect 1 >= brightness >= 0.2. Passed is $1";
    echo "Expect 25000 >= temprature >= 1000. Passed is $2"
  fi
else
    printf "%b" "Error. Number of arguments not equal to 2\n" >&2
fi

# if (( $# == 1 ))
# then if (( check ))
#   then
#     # printf "%b" "Good\n" >&2
#     xrandr --output eDP --gamma 1.0:0.88:0.62 --brightness "$1"

#   else
#     echo "Not 0.2 <= brightness <= 1"
#   fi
# else
#     printf "%b" "Error. Number of arguments not equal to 1\n" >&2
# fi
