# nextflow-mwe

Minimal, workable example of Nextflow

## Requirements 

- Unix-like operating system (Linux, macOS, etc)
- Java 11 

## Quickstart 

1. Install Nextflow (version 23.04.0 or later):
      
        curl -s https://get.nextflow.io | bash

2. Launch the pipeline execution: 

```bash
./nextflow run MarieLataretu/nextflow-mwe \
    -r v1.3 \
    -profile local,mamba
```

## Run a dry-run

```bash
./nextflow run MarieLataretu/nextflow-mwe \
    -r v1.3 \
    -profile local,mamba \
    -stub
```

## Components 

This minimal examples uses the following software components and tools: 

* [Nextflow](https://pubmed.ncbi.nlm.nih.gov/28398311/)
> Di Tommaso P, Chatzou M, Floden EW, Barja PP, Palumbo E, Notredame C. Nextflow enables reproducible computational workflows. Nat Biotechnol. 2017 Apr 11;35(4):316-319. doi: 10.1038/nbt.3820. PubMed PMID: 28398311.

* [fastp](https://github.com/OpenGene/fastp)
>  Chen, Shifu. 2023. “ Ultrafast one-pass FASTQ data preprocessing, quality control, and deduplication using fastp.” iMeta 2, e107. https://doi.org/10.1002/imt2.107

* [BWA](https://github.com/lh3/bwa)
> Li H. (2013) Aligning sequence reads, clone sequences and assembly contigs with BWA-MEM. arXiv:1303.3997v2 [q-bio.GN]