
library(BiocManager)
library(DESeq2)
library(ggplot2)
library(pheatmap)
library(calibrate)
library(Biobase)
library(BiocGenerics)
library(genefilter)

#importing counts data
normCounts <- read.table("tongueCounts_noRep.top500var.tsv", header = TRUE, row.names = 1)
normCounts <- round(normCounts)

#converting to matrix 
normCounts <- as.matrix(normCounts) 

#defining experimental relationships and defining data frame
Diet<-factor(c(rep("Frugivore",4),rep("Nectarivore",3), rep("Piscivore", 1),rep("Insectivore",3), rep("Sanguinivore",1)))
data<- data.frame(row.names = colnames(normCounts), Diet)

#making deseq dataset 
dds<- DESeqDataSetFromMatrix(countData = normCounts, colData = data, design = ~Diet)

#make it a data frame 
df <- as.data.frame(colData(dds))

#log transform
rld<- rlogTransformation(dds, fitType="mean")

#apply DESeq to test for statistically significant differential expression
dds <- DESeq(dds)

#get and order results by p-value
res <- results(dds)
res <- res[order(res$padj), ]


#display the distribution of p-values 
hist(res$pvalue, breaks=50, col="blue", xlab = 'p-value',
     ylab = 'Frequency', main = 'Distribution of p-values')


#heatmap
topVarGenes <- head(order(rowVars(assay(rld)), decreasing = T),50)
mat <- assay(rld)[topVarGenes, ]
mat <- mat - rowMeans(mat)
pheatmap(mat, annotation_col = as.data.frame(colData(rld)),
         show_rownames = T, fontsize_row = 4, treeheight_row = 0)

