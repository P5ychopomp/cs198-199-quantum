#!/bin/bash

# Replace "output.txt" with the desired output text file path
output_file="benchmark_c1024.csv"

# Number of times to run the C program
num_runs=30

# Run the compiled executable in a loop and append the output to the text file
for ((i=1; i<=$num_runs; i++))
do
    "./test_speed1024" >> "$output_file"
done