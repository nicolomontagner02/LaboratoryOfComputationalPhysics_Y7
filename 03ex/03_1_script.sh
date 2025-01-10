#!/bin/bash

mkdir students1
wget -O students.csv https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1
sleep 4
cp students.csv students1/students.csv
cd students1

grep "PoD" students.csv > PoDstudents.csv
grep -v "PoD" students.csv > Othersstudents.csv

counts=0
C=A
for i in {A..Z}
do
    a=$(grep -c "^$i" students.csv)
    a=$((a))
    echo "There are $a students with a surname starting with the letter $i"
    if [ $a -gt $counts ]
    then
        counts=$a
        C=$i
    fi
done

echo "The most common letter is $C"

tot=$(grep -c -v "Family" students.csv)
list=$(grep -v "Family" students.csv)

for i in {1..18}; do
    echo "$i"
    awk -v grp="$i" 'NR % 18 == grp -1' students.csv > "team$i.csv"
done



