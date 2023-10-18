#!/bin/bash
#usermod -d / sudouser

############# Config #####################

BotToken="213******:**********************"

# agar bishtar az yek chat_id darid ba virgoal joda konid 111,222,333
Chat_ids="123456789"
message="AfraVpn - IBSNG BackUp"

############# Config #####################
ROOT="/root"

IP=`curl -s checkip.dyndns.com | cut -d' ' -f 6  | cut -d'<' -f 1`
if [ -z $IP ]; then
    IP=`curl -s ifconfig.me/ip`
fi


BKFile_Name=IBSng_"$IP"__"$(TZ=Asia/Tehran date '+%Y-%m-%d_%H-%M-%S')"
BKFile="$BKFile_Name".bak

pg_dump -Fc -U ibs IBSng >$ROOT/$BKFile

echo -e "\e[92m File size :  \e[39m"
ls -l --block-size=M  $BKFile
echo ""

zip -r  $BKFile_Name.zip $ROOT/$BKFile

yes | rm -rf $ROOT/$BKFile


caption="$message$(TZ=Asia/Tehran date '+%Y-%m-%d %H:%M:%S')"


zip -j -r -s 49m $ROOT/$BKFile_Name.zip $ROOT/$BKFile

zip -j -r -s 49m $ROOT/$BKFile_Name.zip $ROOT/$BKFile

bk_arr=$ROOT/$BKFile_Name.zip
curl -v -s -F "chat_id=${Chat_ids}" \
-F "document=@${bk_arr}"  \
-F "caption=${caption}" \
"https://api.telegram.org/bot${BotToken}/sendDocument"

echo "File sent to Telegram"
yes | rm -rf $BKFile
yes | rm -rf $BKFile_Name*
