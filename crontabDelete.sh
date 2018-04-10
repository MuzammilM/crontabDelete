#Author : MuzammilM
#Deletes an entry from crontab
COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        echo -e "${COLOR}No arguments passed."
        echo -e "${COLOR}Deletes an entry from crontab"
        echo -e "${COLOR}Execution : crontabDelete \"serviceMonitor.sh\" ${reset}"
        exit
fi

crontab -l > crontab && sed  -i.bak '/'$1'/d' crontab && crontab crontab && rm crontab
crontab -l
