#!/bin/bash
gcc puzzle.c -o puzzle.exe
rm -r results
mkdir results
for s in 2048 4096 8192 16384 32768 65536 131072 262144 524288 1048576 2097152; do
    perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./puzzle.exe $s &> ./results/result-$s.txt
done