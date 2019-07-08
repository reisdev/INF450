#!/bin/bash
gcc list.c -lm -o list.exe
rm -d results
mkdir results
for c in 1024 2048 4096 8192 16384 32768 65355; do
    for a in 1 2 4 8 16; do 
        valgrind --tool=cachegrind \
            --I1=$c,$a,128 \
		    --D1=$c,$a,128 \
		    --L2=$c,$a,128 \
		    --LL=$c,$a,128 \
        ./list.exe $c 40 30 |& tee -a ./results/result-$c-$a.txt
    done
done

rm cachegrind.out.*
rm vgcore.*