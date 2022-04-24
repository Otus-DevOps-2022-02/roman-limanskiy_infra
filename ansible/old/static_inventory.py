#!/usr/bin/env python3

import json
from demjson import encode

with open ('inventory.json') as file:
    data = json.load(file)
    print(encode(data))
