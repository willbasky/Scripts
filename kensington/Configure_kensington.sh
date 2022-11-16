#!/usr/bin/env python3

import usb.core as core
import subprocess as sub
import time
from pathlib import Path

vendor=0x047d
product=0x2041
kensington="Kensington_Expert_Setup.sh"
exe_path = Path( __file__ ).absolute().parent.joinpath(kensington)
isConfigured=False

# print( exe_path )

while True:
    dev = core.find(idVendor=vendor, idProduct=product)
    if dev is not None and not isConfigured:
        sub.run([exe_path])
        isConfigured=True
        print("isConfigured")
    if dev is None and isConfigured:
        isConfigured=False
        print("plug out")
    time.sleep(5)
