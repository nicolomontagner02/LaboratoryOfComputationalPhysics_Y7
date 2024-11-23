#!/bin/bash

mkdir students
cd students
file="studenti.csv"
if [ ! -f ./$file ]
then
	wget -O $file https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1 
else
	echo "The file already exist"
fi

grep "PoD" $file > studentiPoD.csv
grep -v "PoD" $file > studentiOthers.csv

counts=0
C=A
for i in {A..Z}
do 
	a=$(grep -c "^$i" studentiPoD.csv)
	a=$((a))
	echo "There are $a surname that begin with $i"
	if [ $counts -lt $a ]
	then
		counts=$a
		C=$i
	fi
done
echo "The most common starting letter for the surname is $C and appears $counts times"

$count=1
for i in 
