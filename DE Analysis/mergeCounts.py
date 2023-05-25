import csv

#create a dictionary to store the merged data
merged_data = {}

file_names = ["chviCounts_noRep.csv", "cabrCounts_noRep.csv", "stluCounts_noRep.csv", 
              "arjaCounts_noRep.csv", "lothCounts_noRep.csv", 
              "angeCounts_noRep.csv", "glsoCounts_noRep.csv", 
              "noleCounts_noRep.csv", "moblCounts_noRep.csv", 
              "mawaCounts_noRep.csv", "ptpaCounts_noRep.csv", 
              "deroCounts_noRep.csv"]


#loop through each file and merge its data with the existing merged data
for file_name in file_names:
    with open(file_name, 'r') as f:
        reader = csv.DictReader(f, delimiter=',')
        for row in reader:
            id_value = row['ID']
            num_reads_value = row['NumReads']
            if id_value not in merged_data:
                merged_data[id_value] = [0] * len(file_names)
            index = file_names.index(file_name)
            merged_data[id_value][index] = num_reads_value

#write the merged data to a new TSV file
with open('mergedCounts_forNorm_noReps.tsv', 'w', newline='') as f:
    writer = csv.writer(f, delimiter='\t')
    writer.writerow(['ID'] + file_names)
    for id_value, num_reads_values in merged_data.items():
        writer.writerow([id_value] + num_reads_values)
