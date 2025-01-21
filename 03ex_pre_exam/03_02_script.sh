#!/bin/bash

grep -v "^#" data1.txt | sed "s/,//g" > data.txt

c=$(grep -o -c "[0-9]\+" data.txt)
n=$(echo $(($c*6)))

echo "There are $n numbers"

l=$(grep "[0-9]\+" data.txt)

count=0
trashold=$(echo "scale=2;50*sqrt(3)" bc)
s=0
s1=0
for i in $l;
do
    if [ $count -e 5 ];
    then
        count=0
    fi

    if [ $count -lt 3 ];
    then
        s=$(echo $(($s+$i)))
        s1=0
        count=$(echo $(($count+1)))
    else;
        s=0
        s1=$(echo $(($s1+$i)))
        count=$(echo $(($count+1)))
    fi

    if [ $count -e 2 ];
    then
        $s=$(echo "scale=2;sqrt($s)" bc)
        if [ $s -lt $trashold]
        then
            ck=$(echo "Smaller")
        else;
            ck=$(echo "Greater")
        fi
    fi

    if [ $count -e 5 ];
    then
        $s1=$(echo "scale=2;sqrt($s1)" bc)
        if [ $s1 -lt $trashold]
        then
            ck1=$(echo "Smaller")
        else;
            ck1=$(echo "Greater")
        fi
    fi

done
