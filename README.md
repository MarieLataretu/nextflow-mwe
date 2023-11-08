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
    -r v1.0 \
    -profile local,mamba
```

## Components 

This minimal examples uses the following software components and tools: 

* [fastp](https://github.com/OpenGene/fastp)
>  Chen, Shifu. 2023. “ Ultrafast one-pass FASTQ data preprocessing, quality control, and deduplication using fastp.” iMeta 2, e107. https://doi.org/10.1002/imt2.107

* [BWA](https://github.com/lh3/bwa)
> Li H. (2013) Aligning sequence reads, clone sequences and assembly contigs with BWA-MEM. arXiv:1303.3997v2 [q-bio.GN]