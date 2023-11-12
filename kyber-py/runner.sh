#!/bin/bash

N=30

OUTPUT_FILE=output_768.txt
PYTHON_SCRIPT=benchmark_kyber.py

rm -f $OUTPUT_FILE

echo "Benchmark for Kyber 768" >> $OUTPUT_FILE
for ((k=1; k<=N; k++)); do
    echo "Iteration $k" >> $OUTPUT_FILE
    python3 $PYTHON_SCRIPT 2> /dev/null 1>> $OUTPUT_FILE
    echo "" >> $OUTPUT_FILE
done