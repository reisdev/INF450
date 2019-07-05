#!/bin/bash
gcc treesort.c -o treesort.exe
perf stat -e task-clock,cycles,cache-misses,cache-references ./treesort.exe 50000