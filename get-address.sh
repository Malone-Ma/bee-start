#!/bin/bash

export TERM=vt100

echo "start get address from clef..."
echo '{"id": 1, "jsonrpc": "2.0", "method": "account_list"}' | nc -U /var/lib/bee-clef/clef.ipc > /root/address.json
cut -c 36-77 /root/address.json > /root/bee.address

cat /root/bee.address

sleep 20s
