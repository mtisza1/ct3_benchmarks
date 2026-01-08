# Commands for fragmented GenBank viruses analyses

```bash
makeblastdb -in data/discovery/refseq/refseq_virus_AA_20260107.fasta -dbtype prot -out data/discovery/refseq/blastDBs/refseq_AA
```

```bash
blastp -query data/discovery/gb_frag/random_4000_gb_AA.faa -db data/discovery/refseq/blastDBs/refseq_AA -outfmt '6 std qlen slen' -max_target_seqs 1000 -out data/discovery/gb_frag/random_4000_gb_AA.blastp.tsv -num_threads 8
```
