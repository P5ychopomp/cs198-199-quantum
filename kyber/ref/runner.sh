#!/bin/bash
#SBATCH --job-name=cs199_quantum
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=60
#SBATCH --output=QUANTUMlog.log

# echo "SLURM_JOBID="$SLURM_JOBID
# echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
# echo "SLURM_NNODES"=$SLURM_NNODES
# echo "Working directory = "$SLURM_SUBMIT_DIR

run_gcc_script512() {
    ./test_speed512 $1
}
run_gcc_script768() {
    ./test_speed768 $1
}
run_gcc_script1024() {
    ./test_speed1024 $1
}

filename="benchmark_desktop_ram16gb.csv"

rm -f $filename

echo
echo "Benchmarking..."

echo "Iteration, , Kyber512, , , Kyber768, , , Kyber1024, , Duration" > $filename
echo " , Keygen, Enc, Dec, Keygen, Enc, Dec, Keygen, Enc, Dec, " >> $filename

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo -n "$i, " >> $filename
    # Run the Python script and append the benchmark_hpc to the CSV file
    run_gcc_script512 $i >> $filename
    run_gcc_script768 $i >> $filename
    run_gcc_script1024 $i >> $filename
    echo "" >> $filename
done

echo "Done."