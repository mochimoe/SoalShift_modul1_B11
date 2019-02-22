mkdir ~/Documents/Sisop1/Decode 

unzip nature.zip

i=1;

for nama in nature/*.jpg
do
	base64 -d $nama  | xxd -r > Decode/decoded-"$i".jpg
	i=$((i+1))
done

