#!/bin/bash

echo "Masukkan nama file "
read filenama
rot=${filenama:0:2}

a=abcdefghijklmnopqrstuvwxyz
b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
rot=`echo $rot|sed 's/^0*//'`
let r=0-$rot

`sudo <~/Documents/Sisop1/"$filenama"  sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" > ~/Documents/Sisop1/"terdekrip$filenama"`

