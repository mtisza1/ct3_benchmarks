#!/bin/bash

# script for running cenotetaker3
# settings for discovery mode with fragmented contigs


CONTIGS=$1

RUN=$2

WD=$3


source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate ct3_test

echo "running cenotetaker3 for $CONTIGS"
date

cenotetaker3 --version

for threads in {1,2,4,8,16,32} ; do
  echo ">>>starting with threads: ${threads}"
  /usr/bin/time -f '\n[time]\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'\
    cenotetaker3\
    -c ${CONTIGS}\
    -r ct3_${RUN}_t${threads}\
    -p T\
    -db virion rdrp\
    --lin_minimum_hallmark_genes 2\
    --circ_minimum_hallmark_genes 2\
    --wrap T\
    --cenote-dbs /data/tisza/data/ct3_dbs/\
    -wd ${WD}\
    -t ${threads}
done

echo "finished"
date
