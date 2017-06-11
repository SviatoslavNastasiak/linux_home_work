#DESCRIPTION
#Program which create a directory with 1000 files and copy them to the another
# directory. When files will be coping you will see a progress bar in your
# terminal 


#!/bin/bash
XXX="[....................]%" # this is our progress bar before coping
sunny="(_)" # just sunny :)
mkdir linux_progress_bar
cd linux_progress_bar
mkdir from
mkdir to
cd from
for i in {1..1000}; do 
    touch "file"$i;
done
cd ..
for i in {1..1000}; do
    cp from/"file"$i to;
   percent_counter=$((i*100/1000)); #It is important to know a percent 
   hesh_test=$((i%50))
   sunny_test=$(($percent_counter%4)) #to change a sunny after each percent 
    if [ $hesh_test -eq 0 ]; then
        XXX=${XXX/./#};
    fi
    case $sunny_test in
        1) 
           sunny="(_)"
           ;;
        2) 
           sunny="(\\)"
           ;;
        3) 
           sunny="(|)"
           ;;
        0)
           sunny="(/)"
           ;;
    esac 
# print a progress bar after each iteration
    echo -ne $sunny$XXX$percent_counter '\r'
done
    echo -ne '\n'

         
    
    


