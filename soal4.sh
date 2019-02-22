

letter=abcdefghojklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

out=$(date +"%H:%M %d-%m-%y")
shif=$(date +"%k")

`sudo mkdir -p ~/Documents/Sisop1`
cat /var/log/syslog | tr "${letter:0:26}" "${letter:${shif}:26}" |tr "${ups:0:26}" "${ups:${shif}:26}"  > ~/Documents/Sisop1/"$out"
