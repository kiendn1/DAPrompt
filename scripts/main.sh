#!/bin/bash

cd ..

# custom config
DATA= "/kaggle/input/oh-data" # you may change your path to dataset here
TRAINER=DAPL

DATASET=$1 # name of the dataset
CFG=$2  # config file
T=$3 # temperature
TAU=$4 # pseudo label threshold
U=$5 # coefficient for loss_u
NAME=$6 # job name


SEED=42

DIR=output/${DATASET}/${TRAINER}/${CFG}/${T}_${TAU}_${U}_${NAME}/a2c/seed_${SEED}

python train.py \
--root "/kaggle/input/oh-data" \
--seed ${SEED} \
--trainer ${TRAINER} \
--dataset-config-file configs/datasets/${DATASET}.yaml \
--config-file configs/trainers/${TRAINER}/${CFG}.yaml \
--output-dir ${DIR} \
TRAINER.DAPL.T ${T} \
TRAINER.DAPL.TAU ${TAU} \
TRAINER.DAPL.U ${U} &