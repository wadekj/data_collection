#########################################################################################
## Purpose: To use exon coordinates from human_aa_data2.xls to extract intronic sequences,
## write to .bed file for each gene
## Author: kjwade
## Created: 5/26/15
#########################################################################################
import sys
def main():

    infile=open(sys.argv[1],'r')
    nullint = open('no_introns.txt', 'w')
    infile.next()
    for line in infile:
        line = line.split('\t')
        gene = line[0]
        chr = line[2]
        exstart = line[9]
        exstop = line[10]
        outfile = open(str(gene+'_intron_coords.bed'), 'w')
        istarts = exstop.split(',')
        istarts = istarts[:len(istarts)-2]
        istops = exstart.split(',')
        istops = istops[1:len(istops)-1]
        if istarts:
            for n in range(0,len(istarts),1):
                start = int(istops[n].strip())
                end = int(istarts[n])
                start = start-1
                end = end+1
                outfile.write('%s\t%i\t%i\n' % (chr,end,start))
        else:
            nullint.write(str(gene+'\n'))
        outfile.close()
    nullint.close()

main()
