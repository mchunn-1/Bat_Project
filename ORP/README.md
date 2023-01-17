# Oyster River Protocol (ORP)

The ORP was developed by Matthew MacManes as a new means of transcriptome assembly. The protocol uses a multi-kmer/multi-assembler approach to transcriptome assembly and is especially useful for non-model organisms. Instructions on how to install the software can be found [here](https://oyster-river-protocol.readthedocs.io/en/latest/docker_install.html). 

In summary, as described by MacManes, the Oyster River Protocol includes the following: 
* Read trimming with Trimmomatic 
* Error correcting with Rcorrecter
* Assembly with Trinity (kmer length 25, without read normalization, rnaSPAdes (kmer length 55 and 75), and TransABySS (kmer length 32) 
* Merging/clustering intoisoform groups with OrthoFuse
* Transcript redundancy reduction with cd-hit
* Transcript identity identification with Diamond
* Gene expression quantification with Salmon  
* Evaluation with BUSCO and TransRate

To read the ORP manuscript please click [here](https://peerj.com/articles/5428/), or for the ORP website click [here](https://oyster-river-protocol.readthedocs.io/en/latest/index.html#)
