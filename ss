#!/bin/bash
export GUM_CHOOSE_CURSOR_FOREGROUND="#79740e"
export GUM_CHOOSE_ITEM_FOREGROUND="#fbf1c7"
sshselect=$(cat /home/user1/scripts/sshm/connectionsss.json | jq '.connections[].name' | gum choose)          
sshid=$(cat ~/scripts/sshm/connectionsss.json | jq '.connections[] | select (.name=='$sshselect')' | jq '.ID')
sshhost=$(cat ~/scripts/sshm/connectionsss.json | jq '.connections[] | select (.ID=='$sshid')' | jq '.hostname')
sshun=$(cat ~/scripts/sshm/connectionsss.json | jq '.connections[] | select (.ID=='$sshid')' | jq '.username')
eval ssh $sshun@$sshhost
