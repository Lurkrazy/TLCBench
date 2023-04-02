#!/bin/bash
#
#SBATCH --account=soc-gpu-np
#SBATCH --partition=soc-gpu-np
#SBATCH --job-name=bert
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --mem=64GB
#SBATCH --gres=gpu:a100:1
#SBATCH --output=bert.log

# load appropriate modules
source /uufs/chpc.utah.edu/common/home/u0940848/load_tvm_v09.sh
source exportTVM.sh
module list
echo $PYTHONPATH
OUT_DIR=$(pwd)/PrintOut
echo $OUT_DIR
mkdir -p $OUT_DIR
FILE_PATH=/uufs/chpc.utah.edu/common/home/u0940848/chendi.li/git/TLCBench
echo $FILE_PATH
cd $FILE_PATH

# Run BERT network
echo "==== Start Execution =====" 
python3 tune_autoscheduler.py --network bert --target "cuda -model=a100" > $OUT_DIR/bert_output.txt 2>&1
echo "==== Done ======"