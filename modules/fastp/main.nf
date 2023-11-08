process FASTP {
    // custom label for easier identification in the log file
    tag "FASTP on $name"
    
    // copy the results to a defined folder
    publishDir params.outdir, mode:'copy'
    
    // engine settings
    conda 'bioconda::fastp=0.23.2'
    container 'rkimf1/fastp:0.23.2--4cc6541'
    
    // execution settings
    cpus 1

    // input and output definition
    input:
    tuple val(name), path(reads)
    
    output:
    tuple val(name), path("${name}.fastp.R{1,2}.fastq.gz"),       emit: reads
    tuple val(name), path("${name}.fastp.json"),                  emit: json
    tuple val(name), path("${name}.fastp.html"),                  emit: html

    // script that is executed by the process
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