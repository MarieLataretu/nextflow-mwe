nextflow.enable.dsl = 2

include { FASTP } from './modules/fastq'
include { BWA_INDEX } from './modules/bwa/index'
include { BWA_MEM } from './modules/bwa/mem'

workflow {
    ch_read = Channel.fromFilePairs(params.reads, checkIfExists: true)

    FASTP(ch_read)

    BWA_INDEX(params.genome)
    
    BWA_MEM(BWA_INDEX.out.index, FASTP.out)
}