#!/bin/bash
gcc list.c -lm -ggdb -o list.exe
rm -r results
mkdir results
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 2048 5 4 |& tee -a results/result-2048.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 4096 15 8 |& tee -a results/result-4096.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 8192 30 20 |& tee -a results/result-8192.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 16384 30 20 |& tee -a results/result-16384.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 32768 35 25 |& tee -a results/result-32768.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 65536 40 30 |& tee -a results/result-65536.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 131072 45 32 |& tee -a results/result-131072.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 262144 50 36 |& tee -a results/result-262144.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 524288 55 38 |& tee -a results/result-524288.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 1048576 60 48 |& tee -a results/result-1048576.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 2097152 65 52 |& tee -a results/result-20957152.txt
