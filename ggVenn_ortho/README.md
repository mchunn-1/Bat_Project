## OrthoFinder and ggVennDiagram

OrthoFinder is a software tool used for orthology and paralogy analysis of protein-coding 
genes across multiple species. It helps in identifying orthologous gene families and inferring evolutionary 
relationships among genes in a comparative genomics context.

OrthoFinder utilizes a phylogenetic approach to identify orthologous groups of genes. It first performs an all-vs-all 
sequence similarity search among protein sequences from different species using BLAST or Diamond. Then, it constructs a
species tree based on a user-provided set of gene sequences. Finally, it uses this species tree to infer orthologous gene families by applying a graph-based clustering algorithm.

The OrthoFinder software is avalible for use on the research cluster. For input, you will need protein sequence files. If you are working with nucleotide sequences, you can use the program "transdecoder" to generate the protien sequence files. 

The **ggVennOrtho.Rmd** file contains the code used for analysis with the OrthoFinder output. In this, a package called "ggVennnDiagram" is used 
as a means of data visualization. Follow this [link](https://rpubs.com/mchunn/1047432) to see example code on how to implement the package and the resulting plots. 
