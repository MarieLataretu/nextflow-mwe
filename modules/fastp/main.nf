process FASTP {
    tag "FASTP on $name"
    publishDir params.outdir, mode:'copy'
    conda 'bioconda::fastp=0.23.2'
    container 'rkimf1/fastp:0.23.2--4cc6541'
    cpus 1

    input:
    tuple val(name), path(reads)
        
    output:
    tuple val(name), path("${name}.fastp.R{1,2}.fastq.gz"),       emit: reads
    tuple val(name), path("${name}.fastp.json"),                  emit: json
    tuple val(name), path("${name}.fastp.html"),                  emit: html

    script:
    """
    fastp \
        --in1 ${reads[0]} \
        --out1 ${name}.fastp.R1.fastq.gz \
        --in2 ${reads[1]} \
        --out2 ${name}.fastp.R2.fastq.gz \
        --json ${name}.fastp.json \
        --html ${name}.fastp.html \
        --low_complexity_filter \
        --overrepresentation_analysis \
        --thread $task.cpus 
    """
}