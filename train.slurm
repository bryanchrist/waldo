#!/bin/bash
#SBATCH -A sds_dl_phd
#SBATCH --partition=gpu
#SBATCH --gres=gpu:2
#SBATCH --ntasks=1

#SBATCH -t 0-05:00:00
#SBATCH -J waldo_train
#SBATCH -o training-%A.out
#SBATCH -e training-%A.err

module purge

module load anaconda
module load cuda/11.4.2
module load singularity pytorch/2.0.1
source activate falcon_40B
#pip install -U -r requirements.txt
pip install torchvision==15.0
conda install -y cudatoolkit
python train.py 