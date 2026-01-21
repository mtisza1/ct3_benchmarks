#!/bin/bash

# script for running metacerberus
# settings for discovery mode with fragmented contigs


CONTIGS=$1

RUN=$2

source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate metacerberus

echo "running metacerberus for $CONTIGS"
date

metacerberus.py --version

metacerberus.py\
  --prodigalgv\
  ${CONTIGS}\
  --hmm "ALL"\
  --dir_out metc_${RUN}

echo "finished"
date
