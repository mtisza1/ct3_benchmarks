# ct3_benchmarks
 Annotation and Discovery benchmarks for Cenote-Taker 3

See the Cenote-Taker 3 [repo](https://github.com/mtisza1/Cenote-Taker3) for tool description.


# Data

See Zenodo [repo](https://zenodo.org/records/16807783)

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.16807783.svg)](https://doi.org/10.5281/zenodo.16807783)


To download, navigate to the Zenodo repo. Make sure you're on the latest data version. Click the `download` button next to **ct3_benchmark_data.tar.gz**. 

Move the tarball to this repo's main directory.

Then unpack:

```bash
tar -xvf ct3_benchmark_data.tar.gz
```

You should now have the `data/` directory with all of the files.

# Code

The easiest way to execute the `R` code is to install R Studio, clone this repo, and double click the `ct3_benchmarks.Rproj` file within the repo's main directory. Running the code requires the data from the above section.

---

# Benchmarking Summary

## Overview

This repository contains benchmarking analyses comparing **Cenote-Taker 3 (CT3)** against other virus discovery and annotation tools including **geNomad**, **Pharokka**, **Metacerberus**, and **phold**.

---

## Tools Compared

| Tool | Type | Analyses |
|------|------|----------|
| Cenote-Taker 3 | Annotation & Discovery | All |
| geNomad | Annotation & Discovery | All |
| Pharokka | Annotation | Annotation benchmarks |
| Metacerberus | Annotation | Annotation benchmarks |
| phold | Annotation | Annotation benchmarks |

---

## Discovery Benchmarks

### Datasets Used

| Dataset | Description | Size | Sequences | Analysis |
|---------|-------------|------|-----------|----------|
| DRR290133 | Long-read assembly, circular contigs | 0.168 Gb | 301 | `compare_virus_calls.Rmd` |
| ERR10905741 | Long-read assembly, circular contigs | 0.175 Gb | 390 | `compare_virus_calls.Rmd` |
| ERR8081307 | Short-read VLP assembly | 0.014 Gb | 5,666 | `short_read_assembly_compare_virus_calls.Rmd` |
| ERR8081362 | Short-read VLP assembly | 0.007 Gb | 2,699 | `short_read_assembly_compare_virus_calls.Rmd` |
| ERR8081370 | Short-read VLP assembly | 0.006 Gb | 3,673 | `short_read_assembly_compare_virus_calls.Rmd` |
| ERR13455686 | Short-read bulk WGS assembly | 0.018 GB | 4,909 | `short_read_assembly_compare_virus_calls.Rmd` |
| SRR36807671 | Short-read bulk WGS assembly | 0.032 Gb | 16,397 | `short_read_assembly_compare_virus_calls.Rmd` |
| SRR36931851 | Short-read bulk WGS assembly | 0.18 Gb | 67,543 | `short_read_assembly_compare_virus_calls.Rmd` |


### Key Metrics

| Metric | Description | Tools Compared |
|--------|-------------|----------------|
| Overlap of discovered viruses | union and differences in sets | CT3, geNomad |
| Hallmark Gene Count | Virus marker genes per detection | CT3, geNomad |


---

## Resource Scaling Benchmarks

### Datasets Used

| Dataset | Subset | Size | Sequences | Analysis |
|---------|-------------|------|-----------|----------|
| Large Metagenome (DRR582205 + ERR9769281 + ERR10905741) | 100% | 5.18 Gb | 177,667 | `resource_testing_metrics.Rmd` |
| Large Metagenome (DRR582205 + ERR9769281 + ERR10905741) | 30% | 1.50 Gb | 53,667 | `resource_testing_metrics.Rmd` |
| Large Metagenome (DRR582205 + ERR9769281 + ERR10905741) | 10% | 0.49 Gb | 17,876 | `resource_testing_metrics.Rmd` |
| Large Metagenome (DRR582205 + ERR9769281 + ERR10905741) | 3% | 0.15 Gb | 5,417 | `resource_testing_metrics.Rmd` |

### Computational Performance

| Test Condition | Dataset Sizes | CPU Counts | Software |
|----------------|---------------|------------|------------|
| Full benchmark | 3%, 10%, 30%, 100% | 1, 2, 4, 8, 16, 32 | Cenote-Taker 3, geNomad |

### Key Metrics

| Metric | Description | Tools Compared |
|--------|-------------|----------------|
| Runtime | Wall-clock execution time | CT3, geNomad |
| Peak Memory | Maximum RAM usage (GB) | CT3, geNomad |
| Speedup | Parallel scaling efficiency (1-32 CPUs) | CT3, geNomad |
| Throughput | Gb processed per hour | CT3, geNomad |

---

## Annotation Benchmarks

### Datasets Used

| Dataset | Description | Genomes | Analysis |
|---------|-------------|---------|----------|
| UHGV 100 | Unified Human Gastrointestinal Virome, high-quality MAGs | 100 | `uhgv_annotation_performance_compare1.Rmd`, `uhgv_run_time_analysis1.Rmd` |
| UHGV 1000 | UHGV MAGs for runtime testing | 1,000 | `uhgv_run_time_analysis1.Rmd` |
| RefSeq Virus | NCBI RefSeq virus reference genomes | 18,969 | `refseq_annotation_rate.Rmd` |
| Gut DTR | Complete (circular) gut virome head-tail phages | 27 | `gut_dtr_analysis1.Rmd` |
| Seawater DTR | Complete (circular) seawater virome head-tail phages | 242 | `seawater_dtrs_analysis.Rmd` |
| Seawater RNA Virome | Complete RNA virus genomes from seawater (PRJNA605028) | 1,133 | `seawater_rna_virome_annotation.Rmd` |
| Random GenBank Viruses | Random GenBank virus genomes for taxonomy accuracy | 3,696 | `ncbi_taxonomy_vs_ct3_taxonomy.Rmd` |

### Key Annotation Metrics

| Metric | Description |
|--------|-------------|
| Non-hypothetical Annotation Rate | Percentage of genes with functional (non-hypothetical) annotation |
| Structural Gene Detection | MCP (major capsid), TerL (terminase large subunit), Portal protein annotation |
| Single-copy Essential Genes | Genomes with exactly 1 copy each of MCP, TerL, and Portal |
| Runtime | Wall-clock time to annotate genome sets |
| Taxonomy Accuracy | Agreement with NCBI taxonomy at each rank (realm to genus) |

### Structural Gene Annotation (Head-Tail Phages)

| Gene | Full Name | Expected Copy Number |
|------|-----------|---------------------|
| MCP | Major Capsid Protein | 1 |
| TerL | Terminase Large Subunit | 1 |
| Portal | Portal Protein | 1 |

### RNA Virus Structural Genes

| Gene | Full Name |
|------|-----------|
| Cap | Capsid/Coat Protein |
| RDRP | RNA-dependent RNA Polymerase |

### Taxonomy Classification

| Rank | Description |
|------|-------------|
| Realm | Highest virus taxonomy rank |
| Kingdom | Second highest rank |
| Phylum | - |
| Class | - |
| Order | - |
| Family | - |
| Genus | Lowest compared rank |

---

## HMM Database Comparisons

| Comparison | Analysis |
|------------|----------|
| CT3 vs Metacerberus | `compare_hmm_consensus_annotations.Rmd` |
| CT3 vs Pharokka | `compare_hmm_consensus_annotations.Rmd` |
| CT3 vs geNomad | `compare_hmm_consensus_annotations.Rmd` |
| CT3 vs CT2 (Cenote-Taker 2) | `compare_hmm_consensus_annotations.Rmd` |

### Metrics

| Metric | Description |
|--------|-------------|
| Missing HMMs | Functional categories in CT3 DB with no similar HMM in other DB |
| % Identity | Sequence identity between HMM consensus sequences |

---

## Benchmark Data Divergence Analysis

| Dataset | Comparison | Analysis |
|---------|------------|----------|
| Seawater RNA Virome | AA identity to RefSeq | `benchmark_data_to_refseq_AAI.Rmd` |
| Seawater DTR | AA identity to RefSeq | `benchmark_data_to_refseq_AAI.Rmd` |
| Gut DTR | AA identity to RefSeq | `benchmark_data_to_refseq_AAI.Rmd` |

---

## Analysis Scripts

### Discovery Analyses

| Script | Description |
|--------|-------------|
| `scripts/discovery/resource_testing_metrics.Rmd` | Computational performance comparison (runtime, memory, scaling) |
| `scripts/discovery/compare_virus_calls.Rmd` | CT3 vs geNomad on long-read circular contigs |
| `scripts/discovery/short_read_assembly_compare_virus_calls.Rmd` | CT3 vs geNomad on short-read assemblies (VLP and WGS) |
| `scripts/discovery/gb_frag/gb_frag_discovery_analysis.Rmd` | Discovery performance on fragmented GenBank genomes |
| `scripts/discovery/gb_frag/gb_to_refseq_aa_compare.Rmd` | AA divergence analysis for GenBank genomes |
| `scripts/discovery/phold_gggenomes.Rmd` | Visualization with gggenomes |
| `scripts/discovery/ERR10905741_phold_gggenomes.Rmd` | Visualization for ERR10905741 |

### Annotation Analyses

| Script | Description |
|--------|-------------|
| `scripts/annotation/uhgv_run_time_analysis1.Rmd` | Runtime comparison on UHGV genomes (100 and 1000) |
| `scripts/annotation/uhgv_annotation_performance_compare1.Rmd` | Annotation rate comparison on 100 UHGV genomes |
| `scripts/annotation/uhgv100_taxonomy_compare.Rmd` | Taxonomy classification comparison on UHGV 100 |
| `scripts/annotation/refseq_annotation_rate.Rmd` | Annotation rate on RefSeq virus genomes |
| `scripts/annotation/gut_dtr_analysis1.Rmd` | Structural annotation on gut virome DTR sequences |
| `scripts/annotation/seawater_dtrs_analysis.Rmd` | Structural annotation on seawater virome DTR sequences |
| `scripts/annotation/seawater_rna_virome_annotation.Rmd` | Annotation comparison on RNA viruses |
| `scripts/annotation/ncbi_taxonomy_vs_ct3_taxonomy.Rmd` | CT3 taxonomy accuracy vs NCBI on GenBank records |
| `scripts/annotation/compare_hmm_consensus_annotations.Rmd` | HMM database comparisons |
| `scripts/annotation/benchmark_data_to_refseq_AAI.Rmd` | AA divergence of benchmark datasets to RefSeq |

