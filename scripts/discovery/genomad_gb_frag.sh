#!/bin/bash

# script for running Genomad
# settings for discovery mode with fragmented contigs


CONTIGS=$1

RUN=$2


source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate genomad

echo "running genomad for $CONTIGS"
date

genomad --version

genomad\
  end-to-end\
  --enable-score-calibration\
  --splits 4\
  ${CONTIGS}\
  genomad_${RUN}_1b\
  /data/tisza/data/genomad_db

echo "finished"
date
