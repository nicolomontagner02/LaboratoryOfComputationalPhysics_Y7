#!/bin/bash

mkdir students
wget -O studenti.csv https://www.dropbox.com/scl/fi/bxv17nrbrl83vw6qrkiu9/LCP_22-23_students.csv?rlkey=47fakvatrtif3q3qw4q97p5b7&e=1
mv studenti.csv students/studenti.csv
cd students
touch studentiPoD.csv
touch studentiOthers.csv
grep -v "*PoD" studenti.csv > studentiPoD.csv
