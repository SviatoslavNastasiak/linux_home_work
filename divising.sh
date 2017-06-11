#!/bin/bash
b=$1; #divided
c=$2; #divisor
m=(); #a place where we will keep our part after a dot

len1=${#b}
len2=${#c}

int_part1=${b%.*}
int_part2=${c%.*}

int_len1=${#int_part1}
int_len2=${#int_part2}

dot_num1=$(($len1-$int_len1-1))
dot_num2=$(($len2-$int_len2-1))
if [ "$dot_num1" -eq "-1" ]; then
    dot_num1=0
fi
if [ "$dot_num2" -eq "-1" ]; then
    dot_num2=0
fi

b=${b//.}; # making our numbers without dots
c=${c//.};

zerotest1=${b:0:1}; # making sure that we have number without leading zeroes(or not)
zerotest2=${c:0:1};

if [ "$zerotest1" -eq "0" -o "$zerotest2" -eq "0" ]; then
b=$((10#$b)); # without leading zeroes
c=$((10#$c));
fi
#transforming numbers to integer
if [ $dot_num2 -gt $dot_num1 ]; then  
    dot_index=$(($dot_num2-$dot_num1))
    while [[ $dot_index -gt 0 ]]; do
        b=${b}"0";
        dot_index=$(($dot_index-1))
    done;
fi
if [ $dot_num1 -gt $dot_num2 ]; then
    dot_index=$(($dot_num1-$dot_num2))
    while [[ $dot_index -gt 0 ]]; do
        c=${c}"0";
        dot_index=$(($dot_index-1))
    done
    fi
# and our dividing
s=$((b/c));
h=$((b-(c*s)));

if [ $h == 0 ];
then
echo "$s.0";
exit;
fi;

p=$3;

for ((i = 0; i < p; i++))
do
h=$((h * 10));
ss=$((h / c));
h=$((h - c * ss));

m[$i]=$ss;

done;

echo -ne "$s.";

for (( i = 0; i < p; i++ ))
do
echo -ne "${m[$i]}";
done;

echo;
