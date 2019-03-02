awk '/cron/ || /CRON/ && !/sudo/  if(NF > 13) {print}  ' /var/log/syslog > ~/modul1/log
