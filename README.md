# Performance Benchmarking of CRYSTALS-Kyber

## Overview
This repository contains performance benchmarking results for CRYSTALS-Kyber, a post-quantum secure cryptographic algorithm. The benchmarks measure the computational efficiency of CRYSTALS-Kyber across different variants, hardware platforms, and programming environments.

## Features
- **Benchmarked Variants**: Kyber512, Kyber768, Kyber1024
- **Benchmarked Operations**: Key Generation, Encapsulation, Decapsulation
- **Tested Platforms**:
  - MacBook M1 Pro 2020
  - HPC @2.6 GHz
  - Ryzen 3500U
  - Ryzen 3600 @2.6 GHz
- **Implementations**: [C](https://github.com/pq-crystals/kyber) and [Python](https://github.com/GiacomoPope/kyber-py)

## Performance Metrics
The benchmarks report the average iterations per second (IPS) for each combination of variant, operation, and platform. Higher IPS values indicate better performance. The shell script will run the selected implementation for 30 iteratons.

## Repository Structure
- **`/kyber`**: Contains the Kyber C original implementation.
- **`/kyber/ref`**: Contains the Kyber C tested implementation.
- **`/kyber/avx2`**: Contains the Kyber C optimized implementation.
- **`/kyber-py`**: Contains the Kyber Python implementation.

## Usage
To reproduce or extend these benchmarks:
1. **Run Benchmarks**:  Edit the file name for the desired machine and execute the benchmarking scripts provided in each implementation. Run the shell script with
```bash
./runner.sh
```
2. **Analyzing Results**: A CSV file will be generated after the shell script is finished executing. Use the CSV files and visualization tools to analyze performance metrics.

## Contributing
Contributions to improve benchmarking methodologies, add new platforms, or optimize performance are welcome. Please fork the repository, make your changes, and submit a pull request.

## License
This repository is licensed under the [MIT License](./kyber-py/LICENSE) for the Python implementation, and [Public Domain]() and [Apache 2.0 License](./kyber/LICENSE) for the C implementation.
