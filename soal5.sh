awk '/cron/,!/sudo/ NF<13 {print}  ' /var/log/syslog > ~/modul1/log
