#!/bin/bash

make clean
make speed

run_gcc_script512() {
    ./test_speed512 $1
}
run_gcc_script768() {
    ./test_speed768 $1
}
run_gcc_script1024() {
    ./test_speed1024 $1
}

rm -f benchmark_desktop.csv

echo
echo "Benchmarking..."

echo "Iteration, , Kyber512, , , Kyber768, , , Kyber1024, , Duration" > benchmark_desktop.csv
echo " , Keygen, Enc, Dec, Keygen, Enc, Dec, Keygen, Enc, Dec, " >> benchmark_desktop.csv

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo -n "$i, " >> benchmark_desktop.csv
    # Run the Python script and append the benchmark_desktop to the CSV file
    run_gcc_script512 $i >> benchmark_desktop.csv
    run_gcc_script768 $i >> benchmark_desktop.csv
    run_gcc_script1024 $i >> benchmark_desktop.csv
    echo "" >> benchmark_desktop.csv
done

echo "Done."