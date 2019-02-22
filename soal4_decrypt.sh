#!bin/bash

letter=abcdefghojklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

for n in ~/Documents/Sisop1/Syslog/*
do
	name=$(basename "$n")
#	echo $name
	shif=${name:0:2}
	out="Decrypted $name"
	cat "$n" | tr "${letter:${sif}:26}" "${letter:0:26}" | tr "${ups:${sif}:26}" "${ups:0:26}"  > "Syslog Decrypted/$out"

done
