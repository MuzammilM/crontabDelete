#Author : MuzammilM
#Deletes an entry from crontab
COLOR='\033[0;31m'
reset=`tput sgr0`

if [ $# -lt 1 ]
then
        echo -e "${COLOR}No arguments passed."
        echo -e "${COLOR}Deletes an entry from crontab"
        echo -e "${COLOR}Execution : crontabDelete \"serviceMonitor.sh\""
        echo -e "${COLOR}Alternatively ; pass a unique id number "
        echo -e "${COLOR}Execution : crontabDelete \"id1\" ${reset}"
        exit
fi

arg=$1
if [[ "$arg" == id* ]]
   then
        echo "Deleting "$arg
        crontab -l > crontab
        line=`cat crontab | grep -n $1 | cut -d : -f 1`
        line2=$((line+1))
        sed -ie ''$line'd;'$line2'd'  crontab && crontab crontab
        crontab -l
   else
        crontab -l > crontab && sed  -i.bak '/'$1'/d' crontab && crontab crontab && rm crontab
        crontab -l
fi
