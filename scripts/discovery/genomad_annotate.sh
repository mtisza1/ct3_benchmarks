#!/bin/bash

# script for running Genomad annotate
# settings for annotate


CONTIGS=$1

RUN=$2


source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate genomad

echo "running genomad for $CONTIGS"
date

genomad --version

genomad\
  annotate\
  --splits 4\
  ${CONTIGS}\
  genomad_an_${RUN}\
  /data/tisza/data/genomad_db

echo "finished"
date
