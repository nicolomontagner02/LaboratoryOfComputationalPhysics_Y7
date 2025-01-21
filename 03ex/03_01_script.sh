#!/bin/bash

mkdir students02

file=students.csv

if [ -f "students02/$file" ]
then
    echo "the file ./$file already exist!"
else
    wget -O $file https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1
    mv ./students.csv ./students02/students.csv
fi

cd students02/

grep "PoD" $file > PoDstudents.csv
grep -v "PoD" $file > Otherstudents.csv

max=0
for i in {A..Z};
do
count=$(grep -c "^$i" students.csv)
echo "There are $count students whose surname start with the letter $i"
if [ $count -gt $max ];
then
    max=$count
    letter=$i
fi
done

echo "The most that most count is $letter that counts for $max surnames"

for i in {1..18};
do
    awk -v grp="$i" "NR %18 == grp -1" students.csv > team$i.csv
done
