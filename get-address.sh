#!/bin/bash

export TERM=vt100

echo '{"id": 1, "jsonrpc": "2.0", "method": "account_list"}' | nc -U /var/lib/bee-clef/clef.ipc > /root/address.json
cut -c 36-77 address > /root/bee.address

cat /root/bee.address

sleep 20s
