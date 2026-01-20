# Commands for fragmented GenBank viruses analyses

### mmseqs2 workflow

```bash
cat ct2_*faa > ct2_all_consensus.faa
```

```bash
mmseqs createdb --dbtype 1 ct2_all_consensus.faa ct2_all_consensus.mmseqs 
```

```bash
mmseqs createdb --dbtype 1  all_ct3_consensus.faa all_ct3_consensus.mmseqs 
```

```bash
mmseqs search all_ct3_consensus.mmseqs ct2_all_consensus.mmseqs all_ct3_consensus.VS.ct2_all.mmseqs1 tmp 
```

### prepare tables for analysis
```bash
mmseqs convertalis all_ct3_consensus.mmseqs ct2_all_consensus.mmseqs all_ct3_consensus.VS.ct2_all.mmseqs1 all_ct3_consensus.VS.ct2_all.mmseqs1.tsv --format-mode 4 --format-output query,target,evalue,gapopen,pident,fident,nident,qstart,qend,qlen,tstart,tend,tlen,alnlen 
```

```bash
seqkit fx2tab -n -i -l random_4000_gb_AA.faa > random_4000_gb_AA.lengths.tsv

seqkit fx2tab -n -i -l random_4000_gb_genomes.fasta > random_4000_gb_genomes.lengths.tsv
```

# Taxonomy of random GenBank records

run cenotetaker3 in `-am` mode:
```bash
cenotetaker3 --cenote-dbs /data/tisza/data/ct3_dbs -c random_4000_gb_clean.1k.fasta -r gb_clean_an1 -p F  -am T
```


# Gene annotation of RefSeq records

Cenote-Taker 3
```bash
(ct3_test) [u241374@cmp02 refseq]$ cenotetaker3 --cenote-dbs /data/tisza/data/ct3_dbs -c refseq_virus_genomes_20260107.fasta -r ct3_refseq_an1 -p F -am T --wrap F
```
