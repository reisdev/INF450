#!/bin/bash
gcc quicksort.c -o quicksort.exe
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 1024
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 2048
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 4096
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 8192
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 16384
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 32768
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 65536
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 131072
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 262144
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 524288
perf stat -e task-clock,cycles,cache-misses,cache-references ./quicksort.exe 1048576
