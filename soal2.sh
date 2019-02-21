a=$(awk -F, '{  if($7== "2012")  i[$1]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -1 | awk -F, '{print $2}')
echo $a

awk -v country="$a" -F,  '{  if($7== "2012" && $1 ==  country )  i[$4]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F, '{print $2}'

awk -v country="$a" -F, '{  if($7== "2012" && $1 == country && ( $4=="Personal Accessories" || $4=="Outdoor Protection"  || $4=="Camping Equipment" ))  i[$6]+=$10} END {for(x in i ){print i[x]","x}}'  WA_Sales_Products_2012-14.csv | sort -nr | head -3 | awk -F, '{print $2}' 



