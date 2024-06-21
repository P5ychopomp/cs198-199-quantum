#!/bin/bash
#SBATCH --job-name=cs199_quantum
#SBATCH --partition=batch
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=60
#SBATCH --output=QUANTUMlog.log

echo "SLURM_JOBID="$SLURM_JOBID
echo "SLURM_JOB_NODELIST"=$SLURM_JOB_NODELIST
echo "SLURM_NNODES"=$SLURM_NNODES
echo "Working directory = "$SLURM_SUBMIT_DIR

run_python_script() {
    python3 benchmark_kyber.py $1
}

rm -f benchmark_hpc.csv

echo
echo "Benchmarking..."

echo "Iteration, , Kyber512, , , Kyber768, , , Kyber1024, , Duration" > benchmark_hpc.csv
echo " , Keygen, Enc, Dec, Keygen, Enc, Dec, Keygen, Enc, Dec, " >> benchmark_hpc.csv

# Run the Python script for 30 iterations
for ((i = 1; i <= 30; i++)); do
    echo "Started Iteration $i."
    echo -n "$i, " >> benchmark_hpc.csv
    # Run the Python script and append the benchmark_hpc to the CSV file
    run_python_script $i >> benchmark_hpc.csv
    echo "" >> benchmark_hpc.csv
done

echo "Done."