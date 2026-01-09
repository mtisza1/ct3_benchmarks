#!/bin/bash

# script for running Cenote-Taker3
# settings for discovery mode with fragmented contigs


CONTIGS=$1

RUN=$2
WD=$3

source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate ct3_test

echo "running cenote-taker for $CONTIGS"
date

cenotetaker3 --version

cenotetaker3\
  -c ${CONTIGS}\
  -r ct3_${RUN}\
  -p F\
  -db virion rdrp dnarep\
  --lin_minimum_hallmark_genes 1\
  --circ_minimum_hallmark_genes 1\
  --wrap F\
  --cenote-dbs /data/tisza/data/ct3_dbs/\
  -wd ${WD}

echo "finished"
date
