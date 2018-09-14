#!/bin/bash

# A script to count the number of bases in a primer
# it expects any number of fasta files as input
# it will be wrong if the last line of sequence information
# does not have a newline character

# expecting a fasta file formatted like this:

# > sequence_id
# AGCTCGT

# this will get the second line in the fule
# that's the head piped into the detail
# then count the characters (the wc -m)
# but then subtract one because wc -m counts newline characters
# sigh.
# another solution would be to usee tr like so
# expr $(head -2 primer_B.fasta | tail -1 | wc -m) - 1
for file in "$@"
do
  FILENAME=$(basename $file .fasta)
  COUNT=$(expr $(head -2 $file | tail -1 | wc -m) - 1)
  echo In $FILENAME, there are $COUNT nucleotides
done
