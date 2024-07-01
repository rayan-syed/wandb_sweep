#!/bin/bash

timestamp=$(date +"%Y%m%d%H%M%S%N")  # %N for nanoseconds

random_suffix=$(($RANDOM % 1000))  # Generates a random number between 0 and 999

jobname="wandb_tutorial_${timestamp}_${random_suffix}"

# Activate virtual environment
module load python3/3.10.12
source .venv/bin/activate

# Run python script to init sweep and print id, capture id (last line - tail)
id=$(python id.py | tail -n 1)

# "Save ID and print to terminal
export SWEEP_ID=$id
echo "SWEEP_ID: $id"

# Run qsub file that runs wandb agent, pass ID with -v
qsub -N "${jobname}" -o "/projectnb/tianlabdl/rsyed/wandb_sweep/logs/${jobname}.qlog" -v SWEEP_ID "sweep.qsub"
