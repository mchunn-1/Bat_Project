
with open('stluCounts_editedGeneID.csv', 'r') as infile, open('stluCounts_noRep.csv', 'w', newline='') as outfile:
    #create a set to keep track of unique rows
    seen = set()
  
    for line in infile:
        #look for row in the set
        if line not in seen:
            #if not there, add it to the set and write it to the output file
            seen.add(line)
            outfile.write(line)
