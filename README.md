# SoalShift_modul1_B11

Soal 1

   Pertama unzip file nature.zip dengan perintah
 
    ```unzip nature.zip```
    
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


Soal nomer 4.

pada soal diminta untuk membalik setiap huruf yang ada pada file syslog sesuai dengan perintah yang dimaksud pada soal.
Untuk menjalankan enkripsi, bash script dibawah ini.
`````

letter=abcdefghojklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
ups=ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ

out=$(date +"%H:%M %d-%m-%y")
shif=$(date +"%k")

`sudo mkdir -p ~/Documents/Sisop1`
cat /var/log/syslog | tr "${letter:0:26}" "${letter:${shif}:26}" |tr "${ups:0:26}" "${ups:${shif}:26}" > ~/Documents/Sisop1/"$out"

`````
