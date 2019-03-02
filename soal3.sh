#!/bin/bash

password=string
while [ 0 ]
do
	while
		password="$(dd if=/dev/urandom|tr -dc A-Za-z0-9|head -c 12)"

		echo "$password"
		
	[ $bsr -gt 0 ] && [ $kcl -gt 0] && [$angka -gt 0]
do :;done


i=1
file=~/Documents/Sisop1/Key/Key
	while [ -s "$file$i.txt" ]
	do
		value=$(<$file$i.txt)
		if test "$value" = "$password"
		then
			break
		fi

		let i=$i+1
	done

	if test "$value" = "$password"
	then
	continue
	fi
	break
done

echo "$password" > $file$i.txt
