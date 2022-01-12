# Bluetooth headset

## Preparation

### Customize sensetive data

1. Create sensetive file

    ```bash
    mkdir sensetive
    ```

2. Add useful content there:

```bash
    #!/bin/bash
    BLUETOOTH="device_name_put_here"
    HEADSET_MAC="headset_mac_address_here"
```

to see your `BLUETOOTH` devices use

    rfkill | grep bluetooth

to see your `HEADSET_MAC` use

    bluetoothctl devices

3. Customize path `/home/$USER/sources/scripts/bluetoothHeadset/`
   at `headphone.sh`


### Set global binary

    ln -s ~/sources/scripts/bluetoothHeadset/headphone.sh ~/.local/bin/ear

## Usage

    ear (on/off)
