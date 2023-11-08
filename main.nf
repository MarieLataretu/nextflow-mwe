// include modules - here, modules are single processes
include { FASTP } from './modules/fastp'
include { BWA_INDEX } from './modules/bwa/index'
include { BWA_MEM } from './modules/bwa/mem'

workflow {
    // create a read input channel
    // the pipeline will fail if the files do not exist
    ch_read = Channel.fromFilePairs(params.reads, checkIfExists: true)

    // run fastp on the input reads
    FASTP(ch_read)

    // index the genome
    BWA_INDEX(params.genome)

    // map the trimmed reads against the genome
    BWA_MEM(BWA_INDEX.out.index, FASTP.out.reads)
}