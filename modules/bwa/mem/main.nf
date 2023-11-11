process BWA_MEM { 
    // custom label for easier identification in the log file
    tag "$name"

    // copy the BAM file to a defined folder
    publishDir "${params.outdir}", mode: 'copy', pattern: "*.bam"

    // engine settings
    conda 'bioconda::bwa=0.7.17 bioconda::samtools=1.18'
    container 'rkimf1/bwa-samtools:0.7.17--6eae1f3'

    // execution settings
    cpus 2

    // input and output definition
    input:
    tuple path(reference), path(index)
    tuple val(name), path(reads)
    
    output:
    tuple val(name), path("${name}.bam"), emit: bam
    
    // script that is executed by the process
    script:
    """
    bwa mem -t $task.cpus \
        ${reference} \
        ${reads} | \
        samtools view -Sb -@ $task.cpus | \
        samtools sort -@ $task.cpus > ${name}.bam
    """
}