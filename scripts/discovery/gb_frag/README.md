# Commands for fragmented GenBank viruses analyses

### mmseqs2 workflow
```bash
mmseqs createdb --dbtype 1 refseq_virus_AA_20260107.fasta refseq_virus_AA_20260107.mmseqs
```

```bash
mmseqs createdb --dbtype 1  random_4000_gb_AA.faa random_4000_gb_AA.mmseqs 
```

```bash
mmseqs search random_4000_gb_AA.mmseqs ../refseq/refseq_virus_AA_20260107.mmseqs random_4000_gb_AA.VS.refseq_virus_AA_20260107.mmseqs1 tmp
```

### prepare tables for analysis
```bash
mmseqs convertalis random_4000_gb_AA.mmseqs ../refseq/refseq_virus_AA_20260107.mmseqs random_4000_gb_AA.VS.refseq_virus_AA_20260107.mmseqs1 random_4000_gb_AA.VS.refseq_virus_AA_20260107.mmseqs1.tsv --format-mode 4 --format-output query,target,evalue,gapopen,pident,fident,nident,qstart,qend,qlen,tstart,tend,tlen,alnlen
```

```bash
seqkit fx2tab -n -i -l random_4000_gb_AA.faa > random_4000_gb_AA.lengths.tsv

seqkit fx2tab -n -i -l random_4000_gb_genomes.fasta > random_4000_gb_genomes.lengths.tsv
```
