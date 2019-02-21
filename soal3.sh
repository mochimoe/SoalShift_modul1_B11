#!/bin/bash

password=string
while [ 0 ]
do
	while
		password="$(dd if=/dev/urandom|tr -dc A-Za-z0-9|head -c 12)"

		echo "$password"
		kcl=0
		bsr=0
		angka=0
		for kata in password
		do
		if [[ $kata = [A-Z] ]]
			then
			let bsr=$bsr+1;
		fi

		if [[ $kata == [a-z] ]]
			then 
			let kcl=$kcl+1;
		fi
		if [[ $kata == [0-9] ]]
			then
			let angka=$angka+1;
		fi
	done
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
