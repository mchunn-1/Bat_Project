##libraries   
install.packages(c('edgeR', 'matrixStats'))
BiocManager::install("DEFormats")
BiocManager::install("tximportData")

library(ape)
library(geiger)    
library(ouch)
library(DESeq2)
library(DEFormats)
library(edgeR)
library(tximportData)
library(matrixStats)
library(dplyr)
library(magrittr)


myCounts <- read.table("merged_counts_forNorm_data.tsv", header=TRUE, row.names=1)

#naming columns
colnames(myCounts)<-c("Chiroderma_villosum", "Carollia_brevicauda", "Sturnira_ludovici", "Artibeus_jamaicensis", 
                      "Hsunycteris_thomasi", "Anoura_geoffroyi", "Glossophaga_soricina", "Noctilio_leporinus",
                      "Mormoops_blainvillei", "Macrotus_waterhousi", "Pteronotus_pusillus", "Desmodus_rotundus")

#making normalization groups.. one per species
normGroups = c("Chiroderma_villosum", "Carollia_brevicauda", "Sturnira_ludovici", "Artibeus_jamaicensis", 
               "Hsunycteris_thomasi", "Anoura_geoffroyi", "Glossophaga_soricina", "Noctilio_leporinus",
               "Mormoops_blainvillei", "Macrotus_waterhousi", "Pteronotus_pusillus", "Desmodus_rotundus")

#normalize with TMM method 
norm1 = DGEList(round(myCounts),group = normGroups)
normTMM <- calcNormFactors(norm1, method="TMM")
normdds = as.DESeqDataSet(normTMM)

#make object to pull out genes with assay
vst_normdds <- vst(normdds)

#pull top var
topVarGenes <- head( order( rowVars( assay(vst_normdds) ), decreasing=TRUE ), 500 )

topvar <-assay(vst_normdds) [ topVarGenes, ]
#save table of normalized counts
write.table(topvar, "tongueCounts.top500var.tsv", na = "NA", col.names = TRUE, row.names = TRUE, sep = "\t", quote = FALSE)
