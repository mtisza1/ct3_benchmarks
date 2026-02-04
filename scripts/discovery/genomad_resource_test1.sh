#!/bin/bash

# script for running Genomad
# settings for discovery mode with fragmented contigs


CONTIGS=$1

RUN=$2


source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate genomad

echo "running genomad for $CONTIGS"
date

genomad --version

for threads in {1,2,4,8,16,32} ; do
  echo ">>>starting with threads: ${threads}"
  /usr/bin/time -f '\n[time]\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'\
    genomad\
    end-to-end\
    --enable-score-calibration\
    --splits 4\
    -t ${threads}\
    ${CONTIGS}\
    genomad_${RUN}_t${threads}_1a\
    /data/tisza/data/genomad_db
done

echo "finished"
date
