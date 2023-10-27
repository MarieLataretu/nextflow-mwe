process BWA_INDEX { 
    tag "$reference.simpleName"
    publishDir "${params.outdir}", mode: 'copy'
    conda 'bioconda::bwa=0.7.17 bioconda::samtools=1.18'
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