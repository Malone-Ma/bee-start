#!/bin/bash

screen_bee_name=$"bee"
cmd_bee=$"bee start --config /root/.beeconfig/bee-config-1.yaml"

echo -e "start screen bee... \n"

spawn screen -S ${screen_bee_name} ${cmd_bee}
