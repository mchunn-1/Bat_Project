# DE Analysis of ORP Assembled Transcriptomes

A general DE anaylsis can be conducted as follows:
Salmon -> tximport -> DESeq2

Salmon is already included in ORP for transcript quantification. The file needed is labled as "quant.sf" and can be located in the "quants" directory of your ORP output for each assembled transcriptome.
The Salmon output file (quant.sf) from ORP does not identify the transcripts, but only preforms quantification as seen in the below example:

However, ORP does include Diamond as a means of transcript identification within each assembly. The Diamond output file can be found in the "assemblies" directory of your ORP output. The file will be labeled in the format "someName.ORP.diamond.txt" and will look similar to the following:

Note that while the Salmon out file contains all trascripts within the assmeblied transcriptome, the Diamond output file contains only those transcripts able to be identified. You will need to merge the two files such that the transcript quantification stats from Salmon are associated with the transcript ID given by Diamond. As of now this can be achieved through file mutlation in SQL, though a more consise script is underway. The merged file should look similar to this:

The next step is tximport which is used to generate the count matrix needed to run DESeq2. As input for tximport you will neeed the Salmon quant file and a tx-to-gene file. The tx-to-gene file is a two-column file consisting of the transcript and the transcript id. Here is an example:

The tximport file is then used to create a count matrix as input for DESeq2. Note that counts will need to be transformed to whole numbers before running DESeq2. An example count matrix is as follows:

