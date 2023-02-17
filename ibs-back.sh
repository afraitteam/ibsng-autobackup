#!/bin/bash

CurDate=$(date +"%Y%m%d%H%M%S")
Captime=$(date +"%Y/%m/%d %H:%M:%S")

FileName="/root/backup_ibs$CurDate.bak"


BotToken='5825489644:AAHGxEuZsTQfgz4-pd1LSEvLNqF2IIX_dIM'

UserID=5732074253

pg_dump -Fc -U ibs IBSng > $FileName

curl -X POST -H "Content-Type:multipart/form-data" -F document=@"$FileName" -F chat_id=$UserID  -F caption="BackUp Ibsng $Captime" "https://api.telegram.org/bot$BotToken/sendDocument"

rm -rf $FileName

