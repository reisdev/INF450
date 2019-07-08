#!/bin/bash
gcc list.c -lm -o list.exe
valgrind --tool=cachegrind    Ffff ./list.exe 65535 40 30 |& tee -a result.txt