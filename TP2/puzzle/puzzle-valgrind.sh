#!/bin/bash
gcc puzzle.c -lm -o puzzle.exe
rm -r results-valgrind
mkdir results-valgrind
for c in 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152; do
    for a in 1 2 4 8 16; do
        valgrind --tool=cachegrind \
            --I1=$c,$a,128 \
            --D1=$c,$a,128 \
            --L2=$c,$a,128 \
            --LL=$c,$a,128 \
            ./puzzle.exe $c |& tee -a ./results-valgrind/result-$c-$a.txt
    done
done

rm cachegrind.out.*
rm vgcore.*