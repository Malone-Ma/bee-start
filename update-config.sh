#!/bin/bash
## 参数介绍
## d) db-capacity
## e) swap-endpoint
## c) 是否启用clef
## p) password

apt update && apt install expect jq

#set接受参数
v_db="30000000"
v_end="81c67524845a4358af12d40915034f14"
v_clef="true"
v_password="beebeebee"

#接收可选参数
while getopts :d:e:c:p: opt
do
  case "$opt" in
  d) v_db=$OPTARG;; 
  e) v_end=$OPTARG;;
  c) v_clef=$OPTARG;;
  p) v_password=$OPTARG;;
  *) echo "Unknown option: $opt" ;;
  esac
done

export TERM=vt100

rm -rf /root/.beeconfig
mkdir /root/.beeconfig
cp /root/bee-start/bee-config-default.yaml /root/.beeconfig/bee-config-1.yaml


sed -i "s/v_db/${v_db}/g" /root/.beeconfig/bee-config-1.yaml
sed -i "s/v_end/${v_end}/g" /root/.beeconfig/bee-config-1.yaml
sed -i "s/v_clef/${v_clef}/g" /root/.beeconfig/bee-config-1.yaml

echo -e "have changed config file... \n"

screen -S bee -X quit

screen_bee_name=$"bee"
cmd_bee=$"bee start --config /root/.beeconfig/bee-config-1.yaml"

/usr/bin/expect <<EOF
spawn screen -S ${screen_bee_name} ${cmd_bee}
expect {
"*Password:" {  send "${v_password}\r";exp_continue }
"*Confirm*" { send "${v_password}\r" }
}
send "\x01d"
expect eof
EOF

