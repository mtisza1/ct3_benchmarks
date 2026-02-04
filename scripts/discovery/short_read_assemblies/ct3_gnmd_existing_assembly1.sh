#!/bin/bash

# download sra data, fastp QC
# assemble with megahit
# get viruses with cenotetaker3 and genomad

SRR=$1

OUTDIR=$2

ASSEMBLY=$3


if [ -s ${ASSEMBLY} ] ; then

	source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate ct3_test

	#cenote-taker 3

	echo "cenote-taker 3 starting"
	date

	cenotetaker3\
	  -c ${ASSEMBLY}\
	  -r ${SRR}_ct3\
	  -p T\
	  -wd ${OUTDIR}\
      -t 16\
	  --lin_minimum_hallmark_genes 2\
      --circ_minimum_hallmark_genes 2\
	  -db virion rdrp dnarep\
      --cenote-dbs /data/tisza/data/ct3_dbs


	source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate genomad

	#genomad

	echo "cenote-taker 3 starting"
	date

	genomad\
      end-to-end\
      --threads 16\
      --splits 4\
      --min-virus-hallmarks 2\
	  ${ASSEMBLY}\
	  ${OUTDIR}/${SRR}_gnmd\
	  /data/tisza/data/genomad_db

else
	echo "${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa megahit assembly not found"
fi



