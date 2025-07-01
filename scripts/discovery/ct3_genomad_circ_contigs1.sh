#!/bin/bash

# script for running Cenote-Taker3 and Genomad
# settings for discovery mode with circular metagenomic contigs


CONTIGS=$1

SRR=$2


source /cmmr/prod/envParams/condanewenv.init && conda activate ct3_env

echo "running cenote-taker for $CONTIGS"
date

cenotetaker3 --version

cenotetaker3\
  -c ${CONTIGS}\
  -r ct3_${SRR}_1b\
  -p T\
  -db virion\
  --lin_minimum_hallmark_genes 2\
  --circ_minimum_hallmark_genes 2\
  --assembler myloasm\
  --wrap F


source /cmmr/prod/envParams/condanewenv.init && conda activate genomad


echo "running genomad for $CONTIGS"
date

genomad --version

genomad\
  end-to-end\
  --enable-score-calibration\
  --splits 4\
  ${CONTIGS}\
  genomad_${SRR}_1b\
  /gpfs1/projects/Tisza_Lab/analysis/mjt_long_read_assembly/genomad_db

echo "finished"
date
