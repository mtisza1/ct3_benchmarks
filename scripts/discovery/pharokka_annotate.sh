#!/bin/bash

# script for running pharokka.py
# settings for annotate


CONTIGS=$1

RUN=$2


source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate pharokka

echo "running pharokka for $CONTIGS"
date

pharokka.py --version

pharokka.py\
  -m\
  -s\
  -g prodigal-gv\
  --meta_hmm\
  -d /data/tisza/data/pharokka_v1.8.0_databases\
  -i ${CONTIGS}\
  -o phar_${RUN}\
  -t 32

echo "finished"
date
