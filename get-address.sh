#!/bin/bash

export TERM=vt100

echo "start get address from clef..."
add_name=$"add"
cmd_add=$"echo '{\"id\":1,\"jsonrpc\":\"2.0\",\"method\":\"account_list\"}' | nc -U /var/lib/bee-clef/clef.ipc"

/usr/bin/expect <<EOF
spawn screen -S ${add_name} ${cmd_add}
send "\x03"
expect eof
EOF

cut -c 36-77 /root/address.json > /root/bee.address

cat /root/bee.address

sleep 20s
