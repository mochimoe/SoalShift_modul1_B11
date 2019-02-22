# SoalShift_modul1_B11

**Soal Nomer 1.**

   Pertama unzip file nature.zip dengan perintah
 
    `unzip nature.zip`
    
   Setelah itu akan muncul folder dengan nama nature yang berisi file berekstensi .jpg yang masih terenkripsi. Untuk mendekripsi file tersebut gunakan perintah 
  ```base64 -d "nama_file.jpg"  | xxd -r > "nama_file_output.jpg"```
    Untuk mendekripsi seluruh file gunakan script yang ada pada soal1.sh yang nampak seperti berikut:

   ```
  mkdir Decode
  unzip nature.zip 
  i=1; 
  for nama in nature/*.jpg 
  do 
      base64 -d $nama  | xxd -r > Decode/decoded-"$i".jpg
      i=$((i+1)) 
  done
  ```
   Semua file yang sudah di dekripsi akan berada pada folder Decode dan siap untuk dibuka. Selanjutnya syarat untuk membuka file dari nature.zip pada 14 Februari pukul 14:14 atau pada haru Jumat di bulan Februari dapat dilakukan dengan cara menambahkan cronjob dengan cara mengetikan **crontab -e** lalu menginputkan script berikut:

   ```
   14 14 14 2 * [user] [Path to soal1.sh]
   14 14 * 2 5 [user] [Path to soal1.sh]
   ```

   Lalu simpan, selanjutnya script akan berjalan secara otomatis pada waktu yang telah ditetapkan pada cornjob.
   
**Soal Nomer 2.**

   Terdapat sebuah file **WA_Sales_Products_2012-14.csv** yang berisi data penjualan negara. Kita harus mencari negara manakah yang memiliki penujualan terbanyak pada tahun 2012. Script yang digunakan adalah sebagai berikut:

   ```
a=$(awk -F, '{  if($7== "2012")  i[$1]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -1 | awk -F, '{print $2}')|
```

   Dengan menggunakan script ini akan didapatkan negara dengan penjualan terbanyak yakni **United States**. Hasil dari dari AWK akan disimpan dalam variable **a** sehingga dapat digunakan untuk pencarian selanjutnya.
   Pencarian selanjutnya adalah mencari 3 penjualan product line terbanyak dari **United States**. Script yang digunakan adalah sebagai berikut:

   ```
awk -v country="$a" -F,  '{  if($7== "2012" && $1 ==  country )  i[$4]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F, '{print $2}'
```

   Dengan menggunakan script diatas akan didapatkan 3 product line dengan penjualan terbanyak yakni **Personal Accessories, Outdoor Proctection, dan Camping Equipment**. 
   Selanjutnya adalah mencari 3 teratas penjualan product berdasar dari 3 product line diatas. Untuk mencarinya dapat menggunakan script berikut:

   ```
awk -v country="$a" -F, '{  if($7== "2012" && $1 == country && ( $4=="Personal Accessories" || $4=="Outdoor Protection"  || $4=="Camping Equipment" ))  i[$6]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F, '{print $2}'
```

   Setelah menjalankan script diatas akan didapatkan hasil **Zone, Trailchef Water Bag, dan Single Edge'.

**Soal Nomer 3.**

   Pada soal 3, kita diminta untuk membuat sebuah password sepanjang 12 karakter yang terdiri dari huruf kecil, huruf kapital, dan angka yang akan disimpan pada sebuah file dengan extensi .txt dengan beberapa ketentuan pemberian nama secara terurut dimulai dari 1 tanpa ada yang terlewat meski terdapat file yang dihapus. Juga dapat dipastikan bahwa password yang dipastikan tidak ada yang sama. Script untuk menyelesaikan soal tersebut adalah sebagai berikut:

```
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
```

**Soal Nomer 4.**

   Pada soal diminta untuk membalik setiap huruf yang ada pada file syslog sesuai dengan perintah yang dimaksud pada soal.
Untuk menjalankan enkripsi, bash script dibawah ini.
`````

letter=abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

out=$(date +"%H:%M %d-%m-%y")
shif=$(date +"%k")

`sudo mkdir -p ~/Documents/SyslogBackUp`
cat /var/log/syslog | tr "${letter:0:26}" "${letter:${shif}:26}" |tr "${ups:0:26}" "${ups:${shif}:26}" > ~/Documents/SyslogBackUp/"$out"

`````

untuk mendekrip fie syslog tadi jalankan script dibawah ini

```
#!/bin/bash

echo "Masukkan nama file "
read filenama
rot=${filenama:0:2}

a=abcdefghijklmnopqrstuvwxyz
b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
rot=`echo $rot|sed 's/^0*//'`
let r=0-$rot

`sudo <~/Documents/SyslogBackUp/"$filenama"  sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" > ~/Documents/SyslogBackUp/"terdekrip$filenama"`

```

**Soal Nomer 5.**

Pada soal 5, harus menyimpan record dari syslog dengan beberapa kriteria yakni tidak mengandung string "sudo", tetapi mengandung string "cron" yang mana harus case insensitive, jumlah field pada 1 line kurang dari 13, memasukan hasil pencarian pada direktori ~/modul1 , dan dilakukan secara otomatis setiap 6 menit dimulai dari menit ke-2 diakhiri pada menit ke-30. 

```
awk '/cron/,!/sudo/ NF<13 {print}  ' /var/log/syslog > ~/modul1/log
```
Untuk script cronjobny adalah sebagai berikut:
```
2-30/6 * * * * [user] [Path to script]
```
