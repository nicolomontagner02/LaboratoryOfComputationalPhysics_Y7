#!/bin/bash

grep -v "#" data1.txt | sed "s/,//g" > data.txt

c=$(grep -o "[0-9]\+" data.txt)

for i in $c;
do
    f=$(echo $(($i%2)))
    if [ $f -ne 0 ];
    then
        count=$(echo $(($count+1)))
    fi
done

echo "There are $count even number in data.txt"

l=$(grep "[0-9]\+" data.txt)

for i in $l;
do
    if [ $count -le 2 ];
    then
        s=$(echo "scale=0;sqrt($j)" | bc)
        s1=$(echo $(($s+$s1)))
        count=$(echo $(($count+1)))
    else
        s=$(echo "scale=0;sqrt($j)" | bc)
        s2=$(echo $(($s+$s2)))
    fi
    echo "$s1 and $s2"
done
