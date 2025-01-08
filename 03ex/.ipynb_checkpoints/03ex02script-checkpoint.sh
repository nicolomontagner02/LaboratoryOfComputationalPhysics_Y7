#!/bin/bash

if [ -z $1 ]
then
    echo "This script requires as input an integer number (total copy of output file)"
    exit
fi

cp ../data.csv data.csv

grep -v "^#" data.csv | sed "s/,//g" > data.txt
rm data.csv


n=$(grep -o "[0-9]\+" data.txt | wc -w)
echo "The number of numbers in data.txt file is"$n

greater_count=0

com=$(echo "scale=0;sqrt(3)*50" |bc)

# Leggere il file riga per riga
while IFS=' ' read -r x y z x1 y1 z1; do
# Calcolare la radice della somma dei quadrati
value=$(echo "scale=0;sqrt($x^2 + $y^2 + $z^2)" | bc -l)
if [ $value -gt $com ];
then greater_count=$(echo $(($greater_count +1)))
fi
done < data.txt
# Stampare i risultati
echo "Entries greater than $com: $greater_count"
smaller_count=$(echo $(($n-$greater_count)))
echo "Entries lower than $com: $smaller_count"

for ((i=1; i<=$1; i++));do
out_file="data$i.txt"
while IFS=' ' read -r x y z x1 y1 z1; do
    echo $(($x/$i)) $(($y/$i)) $(($z/$i)) $(($x1/$i)) $(($y1/$i)) $(($z1/$i)) >> $out_file
done < data.txt
done
