import csv

with open('stluCounts.csv', 'r') as infile, open('stluCounts_editedGeneID.csv', 'w', newline='') as outfile:
    reader = csv.reader(infile)
    writer = csv.writer(outfile)
    
    #skip header in file 
    next(reader)

    for row in reader:
        #split the first column on the "|" 
        gene_id = row[0].split('|')[2]
        # Get the substring between the "|" and "_" 
        gene_code = gene_id.split('_')[0]
        #update the first column with the new gene code
        row[0] = gene_code
        #write the updated row to  file
        writer.writerow(row)
