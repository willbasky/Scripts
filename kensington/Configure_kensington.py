#!/usr/bin/env python3

import usb.core as core
import subprocess as sub
import time
from pathlib import Path

kensington="kensington/Kensington_Expert_Setup.sh"
exe_path = Path().resolve().joinpath(kensington)
isConfigured=False

while True:
    dev = core.find(idVendor=0x047d, idProduct=0x2041)
    if dev is not None and not isConfigured:
        sub.run([exe_path])
        isConfigured=True
        print("isConfigured")
    if dev is None and isConfigured:
        isConfigured=False
        print("plug out")
    time.sleep(5)
