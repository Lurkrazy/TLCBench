#!/bin/bash
#
#SBATCH --account=soc-gpu-np
#SBATCH --partition=soc-gpu-np
#SBATCH --job-name=bert
#SBATCH --output=bert.log
#SBATCH --nodes=1
#SBATCH --ntasks=28
#SBATCH --mem=0
#SBATCH --gres=gpu:a100:1

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

echo "==== Start Execution =====" 
python3 tune_autoscheduler.py --network bert --target "cuda -model=a100" 2>&1 | tee bert.log
echo "==== Done ======"
