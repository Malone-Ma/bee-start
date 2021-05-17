#!/bin/bash
## 参数介绍
## d) db-capacity
## e) swap-endpoint
## c) 是否启用clef
## p) password

v_password="beebeebee"

export TERM=vt100

echo -e "let's start the bee programe... \n"

screen_bee_name=$"bee"


# cmd_bee=$"bee start --verbosity 5 --swap-endpoint https://goerli.infura.io/v3/304ee59b22ca40eb86be1c051c8d79e2 --debug-api-enable --clef-signer-enable --clef-signer-endpoint /var/lib/bee-clef/clef.ipc"
cmd_bee=$"bee start --config /root/.beeconfig/bee-config-1.yaml"

echo -e "start screen bee... \n"

# screen -dmS $screen_bee_name
# screen -x -S $screen_bee_name -p 0 -X stuff "$cmd_bee"
# screen -x -S $screen_bee_name -p 0 -X stuff "\n"

/usr/bin/expect <<EOF
spawn screen -S ${screen_bee_name} ${cmd_bee}
expect {
"*Password:" {  send "${v_password}\r";exp_continue }
"*Confirm*" { send "${v_password}\r" }
}
send "\01d"
expect eof
EOF
