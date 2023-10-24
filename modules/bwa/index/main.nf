process BWA_INDEX { 
    tag "$reference.simpleName"
    publishDir "${params.output_dir}", mode: 'copy'
    conda 'bioconda::bwa=0.7.17'
    container 'rkimf1/bwa-samtools:0.7.17--6eae1f3'
    cpus 1

    input:
    path(reference)
        
    output:
    tuple path(reference), path("${reference}.*"), emit: index

    script:
    """
    bwa index ${reference}
    """
}