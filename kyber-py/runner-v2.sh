#!/bin/bash

run_python_script() {
    python benchmark_kyber.py $1
}
echo "Benchmarking..."

echo "Iteration, Kyber512, , , Kyber768, , , Kyber1024, , " > benchmark_windows.csv
echo " , Keygen, Encryption, Decryption, Keygen, Encryption, Decryption, Keygen, Encryption, Decryption " >> benchmark_windows.csv

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo -n "Iteration $i" >> benchmark_windows.csv
    # Run the Python script and append the benchmark_windows to the CSV file
    echo -n ", " >> benchmark_windows.csv
    run_python_script $i >> benchmark_windows.csv
    echo "" >> benchmark_windows.csv
done

echo "Done."

# Shutdown PC
# powershell.exe -ExecutionPolicy Bypass -File "shut.ps1"

