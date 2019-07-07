#!/bin/bash
gcc list.c -lm -o list.exe
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 128 5 2 &> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 256 10 4 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 512 20 8 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 1024 40 16 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 2048 80 32 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 4096 160 64 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 8192 320 128 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 16384 640 256 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 32768 1280 512 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./list.exe 65535 2560 1024 &>> result.txt