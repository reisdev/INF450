#!/bin/bash
gcc bubblesort.c -lm -o bubblesort.exe
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 128 &> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 256 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 512 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 1024 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 2048 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 4096 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 8192 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 16384 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 32768 &>> result.txt
perf stat -d -e task-clock,cycles,L1-dcache-load-misses,L1-dcache-loads,instructions,branch,branch-misses ./bubblesort.exe 65535 &>> result.txt