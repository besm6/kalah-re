#!/bin/sh
~/src/github/dispak/besmtool/besmtool dump 1234 --start=0200 --length=6 --to-file=re-kalah.o
./dtran -n -E entry.txt -d re-kalah.o > re-kalah.asm
