

letter=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

out=$(date +"%H:%M %d-%m-%y")
shif=$(date +"%k")

mkdir ~/Documents/SyslogBackUp
cat /var/log/syslog | tr "${letter:0:26}" "${letter:${shif}:26}" |tr "${ups:0:26}" "${ups:${shif}:26}"  > ~/Documents/SyslogBackUp/"$out"
