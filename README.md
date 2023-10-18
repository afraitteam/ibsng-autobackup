# ibsng-autobackup
automatically Backup Ibsng and send to telegram

Download Script
````
cd /root
wget https://raw.githubusercontent.com/afraitteam/ibsng-autobackup/main/ibsng-backup.sh
````


Set Cron Job
````
0 0 * * * bash /root/ibsng-backup.sh  >/dev/null 2>&1
````
