#!/bin/bash

mkdir students
file=students.csv

if [ -f "./$file" ]
then
    echo "The file ./$1 alreasy exist!"
else
    wget -O students.csv https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1
    cp students.csv ./students/students.csv
fi
cp students.csv ./students/students.csv
cd ./students

grep "PoD" students.csv > PoD_students.csv
grep -v "PoD" students.csv > Other_students.csv

max=0
for i in {A..Z};
do

    c=$(grep -c "^$i" students.csv)
    if [ $c -gt $max ]
    then
        max=$c
        letter=$i
    fi
    echo "There are $c surname that start with the letter $i"

done

echo "The most common letter is $letter"

for i in {1..18};
do
    awk -v grp="$i" "NR %18 == grp-1" students.csv > team_$i.csv
done
