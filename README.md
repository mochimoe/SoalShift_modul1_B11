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
