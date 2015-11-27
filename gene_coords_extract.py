#########################################################################
## Program to take in human_aa_data.txt file, extract CDSstart and write out 
## coordinates that correspond to the 35kb region upstream from the nucleotide 
## before the start codon of that gene
## Author: kjwade
## Created: 4/22/15
## Input: [1] human_aa_data.txt
##########################################################################

import sys

def main():
    data = open(sys.argv[1], 'r')
    data.next()
    for i in data:
        i = i.split('\t')
        gene = i[0]
        xsome = i[2]
        start = 0
        end =0
        # Check which strand gene is on and generate upstream coordinates accordingly
        if i[3] == '+':
            end = int(i[6])- 1
            start = end - 35000
        else:
            start = int(i[7])+1
            end = start + 35000
        name = str(gene + '_upstream_coords.bed')
        out = open(name, 'w')
        out.write('%s\t%s\t%s\n' % (xsome,start,end))
        out.close()
    data.close()
main()
