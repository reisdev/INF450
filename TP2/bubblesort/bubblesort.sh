#!/bin/bash
gcc bubblesort.c -lm -o bubblesort.exe
rm -r results
mkdir results
for c in 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152; do
    perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe $C &> ./result/result-$c.txt
done