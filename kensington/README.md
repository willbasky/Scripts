# kensington

This is a configuration script for the Kensington Expert trackball that remaps some of the buttons and edits some props.

This scripts dependancies are `xinput` `grep` and `sed` which should be installed on all distros by default.

There are comments in the script which should help you setup your own config.

# Layout

If you run the script as is without changing anything this will be your layout:
```
______________   _________  ________________
| back       |   |       |  | right click  |
--------------   |       |  ----------------
______________   |       |  ________________
| left click |   |       |  | middle click |
--------------   ---------  ----------------

```
1. Natural scrolling will be enabled. ( scrolling is smoother with this on )
2. Ball acceliration will be disabled.
3. Middle click + ball roll can also be used to scroll. ( very smooth and fast scrolling )

# Usage
You can run the script simpy by calling the script `./Kensington_Expert_Setup.sh` there is no need for root.

# Automatic applying configuration on linux

1. Update `vendor` and `product` variables in `Configure_kensington.py` with `lsusb` which shows `vendor:product` of usb devices.
2. Add `Configure_kensington.py` to autostart on login. This script check is trackball connected every 5 minutes and if it is connected apply configuration.


# Video
[![Youtube](https://img.youtube.com/vi/hIAJ9Icq3KU/0.jpg)](https://www.youtube.com/watch?v=hIAJ9Icq3KU)
