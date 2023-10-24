process BWA_MEM { 
    tag "$name"
    publishDir "${params.output_dir}", mode: 'copy'
    conda 'bioconda::bwa=0.7.17'
    container 'rkimf1/bwa-samtools:0.7.17--6eae1f3'
    cpus 2

    input:
    tuple val(name), path(reads)
    tuple path(reference), path(index)
        
    output:
    tuple val(name), path("${name}.bam"), emit: bam

    script:
    """
    bwa mem -t $task.cpus \
        ${reference} \
        ${reads} | \
        samtools view -Sb -@ $task.cpus | \
        samtools sort -@ $task.cpus > ${name}.bam
    """
}