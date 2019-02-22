# SoalShift_modul1_B11

Soal Nomer 1.

   Pertama unzip file nature.zip dengan perintah
 
    unzip nature.zip
    
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
   Semua file yang sudah di dekripsi akan berada pada folder Decode dan siap untuk dibuka.

   
Soal Nomer 2.

   Terdapat sebuah file WA_Sales_Products_2012-14.csv yang berisi data penjualan negara. Kita harus mencari negara manakah yang memiliki penujualan terbanyak pada tahun 2012. Script yang digunakan adalah sebagai berikut:
   `a=$(awk -F, '{  if($7== "2012")  i[$1]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -1 | awk -F, '{print $2}')`
   Dengan menggunakan script ini akan didapatkan negara dengan penjualan terbanyak yakni United States. Hasil dari dari AWK akan disimpan dalam variable a sehingga dapat digunakan untuk pencarian selanjutnya.
   Pencarian selanjutnya adalah mencari 3 penjualan product line terbanyak dari United States. Script yang digunakan adalah sebagai berikut:
   `awk -v country="$a" -F,  '{  if($7== "2012" && $1 ==  country )  i[$4]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F, '{print $2}'`
   Dengan menggunakan script diatas akan didapatkan 3 product line dengan penjualan terbanyak yakni Personal Accessories, Outdoor Proctection, dan Camping Equipment.
   

Soal Nomer 4.

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

````````
#!/bin/bash

echo "Masukkan nama file "
read filenama
rot=${filenama:0:2}

a=abcdefghijklmnopqrstuvwxyz
b=ABCDEFGHIJKLMNOPQRSTUVWXYZ
rot=`echo $rot|sed 's/^0*//'`
let r=0-$rot

`sudo <~/Documents/SyslogBackUp/"$filenama"  sed "y/$a$b/${a:$r}${a::$r}${b:$r}${b::$r}/" > ~/Documents/SyslogBackUp/"terdekrip$filenama"`

`````````
