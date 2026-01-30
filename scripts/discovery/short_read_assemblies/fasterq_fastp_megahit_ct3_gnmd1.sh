#!/bin/bash

# download sra data, fastp QC
# assemble with megahit
# get viruses with cenotetaker3 and genomad

SRR=$1

OUTDIR=$2

source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate ncbi_datasets

echo "running download, assembly pipeline for $SRR"
date

if [ ! -d ${OUTDIR} ] ; then
	mkdir ${OUTDIR}
fi


#download
echo "fasterq-dump starting"
date

fasterq-dump $SRR -O $OUTDIR

if [ -s ${OUTDIR}/${SRR}_1.fastq ] && [ -s ${OUTDIR}/${SRR}_2.fastq ] ; then

	echo "fastp starting"
	date

	fastp -D --dup_calc_accuracy 6 -w 16\
	  -i ${OUTDIR}/${SRR}_1.fastq -o ${OUTDIR}/${SRR}_1.fastp.fastq \
	  -I ${OUTDIR}/${SRR}_2.fastq -O ${OUTDIR}/${SRR}_2.fastp.fastq \
	  -j ${OUTDIR}/${SRR}.fastp.json -h ${OUTDIR}/${SRR}.fastp.html

elif [ -s ${OUTDIR}/${SRR}.fastq ] ; then

	echo "single end ${OUTDIR}/${SRR}.fastq "
	echo "fastp starting"
	date

	fastp -D --dup_calc_accuracy 6 -w 16\
	  -i ${OUTDIR}/${SRR}.fastq -o ${OUTDIR}/${SRR}.fastp.fastq \
	  -j ${OUTDIR}/${SRR}.fastp.json -h ${OUTDIR}/${SRR}.fastp.html

else
	echo "$SRR fastqs not found"
fi

if [ -s ${OUTDIR}/${SRR}_1.fastp.fastq ] && [ -s ${OUTDIR}/${SRR}_2.fastp.fastq ] ; then

	echo "megahit starting"
	date

	megahit\
	  -1 ${OUTDIR}/${SRR}_1.fastp.fastq\
	  -2 ${OUTDIR}/${SRR}_2.fastp.fastq\
	  --min-contig-len 900\
	  --k-max 99 -o ${OUTDIR}/${SRR}_megahit\
	  --out-prefix ${SRR}

	# makes ${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa

elif [ -s ${OUTDIR}/${SRR}.fastp.fastq ] ; then

	echo "megahit starting"
	date

	megahit\
	  -r ${OUTDIR}/${SRR}.fastp.fastq\
	  --min-contig-len 900\
	  --k-max 99 -o ${OUTDIR}/${SRR}_megahit\
	  --out-prefix ${SRR}

	# makes ${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa

else
	echo "$SRR fastp-filtered fastqs not found"
fi

if [ -s ${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa ] ; then

	source /data/tisza/analyses/mjt_sandbox/conda_mjt.init && conda activate ct3_test

	#cenote-taker 3

	echo "cenote-taker 3 starting"
	date

	cenotetaker3\
	  -c ${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa\
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
	  ${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa\
	  ${OUTDIR}/${SRR}_gnmd\
	  /data/tisza/data/genomad_db

else
	echo "${OUTDIR}/${SRR}_megahit/${SRR}.contigs.fa megahit assembly not found"
fi



