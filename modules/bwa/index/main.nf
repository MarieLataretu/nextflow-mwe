process BWA_INDEX { 
    // custom label for easier identification in the log file
    tag "$reference.simpleName"

    // engine settings
    conda 'bioconda::bwa=0.7.17 bioconda::samtools=1.18'
    container 'rkimf1/bwa-samtools:0.7.17--6eae1f3'

    // execution settings
    cpus 1

    // input and output definition
    input:
    path(reference)
    
    output:
    tuple path(reference), path("${reference}.*"), emit: index

    // script that is executed by the process
    script:
    """
    bwa index ${reference}
    """
}