#!/usr/bin/env python3

import json
import re
import subprocess
from demjson import encode

inventory = {
  "instances": {
    "hosts": [ ],
  "_meta": {
    "hostvars": { }
}}}

yc_command = subprocess.getoutput(["yc compute instance list"])
hosts = []

for line in yc_command.split('\n'):
    match = re.search( r'^\| \S+\s+\| (\S+)\s+\| \S+\s+\| \S+\s+\| (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+\| (\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})\s+\|$', line.rstrip() )

    if not match:
        continue

    else:
        tmp_name = match.group(1)
        tmp_ip = match.group(2)
        hosts.append(tmp_ip)
        tmp_hostvars = {"host_specific_var": tmp_name }
        inventory['instances']['_meta']['hostvars'][tmp_ip] = tmp_hostvars

inventory['instances']['hosts'] = hosts

print(encode(inventory))
