#!/bin/bash

run_python_script() {
    python3 benchmark_kyber.py $1
}
echo "Benchmarking..."

echo "Iteration, Kyber512, , , Kyber768, , , Kyber1024, , " > py_winlaptop.csv
echo " , Keygen, Encryption, Decryption, Keygen, Encryption, Decryption, Keygen, Encryption, Decryption " >> py_winlaptop.csv

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo -n "Iteration $i" >> py_winlaptop.csv
    # Run the Python script and append the py_winlaptop to the CSV file
    echo -n ", " >> py_winlaptop.csv
    run_python_script $i >> py_winlaptop.csv
    echo "" >> py_winlaptop.csv
done

echo "Done."

# Shutdown PC
# powershell.exe -ExecutionPolicy Bypass -File "shut.ps1"

