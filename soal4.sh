

letter=abcdefghojklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

out=$(date +"%H:%M %d-%m-%y")
shif=$(date +"%H")

cat /var/log/syslog | tr "${letter:0:26}" "${letter:${shif}:26}" |tr "${ups:0:26}" "${ups:${shif}:26}"  > ~/Documents/Sisop1/"$out"