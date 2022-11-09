# Bluetooth headset

## Preparation

### Customize sensitive data

1. Create sensitive file in parent directory of `bluetoothHeadset`

    ```bash
    touch sensitive
    ```

2. Add useful content to sensitive:

```bash
    #!/bin/bash
    BLUETOOTH="device_name_put_here"
    HEADSET_MAC="headset_mac_address_here"
```

to see your `BLUETOOTH` devices use

    rfkill | grep bluetooth

to see your `HEADSET_MAC` use

    bluetoothctl devices


### Set global binary

    ln -s ~/path/to/bluetoothHeadset/headphone.sh ~/.local/bin/ear

## Usage

    ear (on/off)
