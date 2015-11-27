#############################################################################################
## Program that uses hg19 protID to find and extract corresponding alignment fragments in 
## interleaved format, concatenate them and convert to sequential fasta format for use in phyloP
## Input: [1] knownGene.exonNuc.fa [2] human_aa_data.txt [3] 46way
## Author: kjwade
## Created: 4/28/15
############################################################################################# 


from collections import defaultdict
import sys

def main():
    idfilename = sys.argv[2]   # Takes file containing ucsc id info.xls
    alignfilename = sys.argv[1]   # Takes file containing the cds_alignments.fasta
    aligntype = sys.argv[3]
    id_file = open(idfilename, 'r')

    id_dict = make_dict(id_file)
    print id_dict.keys()
    align_dict = read_file(id_dict, alignfilename)
    print align_dict.keys()
    write_maf(align_dict, aligntype)
    
    id_file.close()
# Make dictionary containing hg19 alignID info
def make_dict(id_file):
    id_dict = defaultdict(str)
    id_file.next()
    for line in id_file:
        line = line.strip()
        line = line.split('\t')
        id_dict[line[1]]+= line[0]   # Makes ucsc alignid the key and the gene name the value
    return id_dict

# Generator to iterate through knownGene.exonNuc.fa without having to store each line in memory
def line_generator(alignfile):
    for line in alignfile:
        yield line
    yield None

# Read each line, check if id matches key in dictionary, append alignment data while it does
def read_file(id_dict, alignfilename):
    align_dict = defaultdict(lambda: defaultdict(str))
    name_dict = {'hg19':'hg19', 'mm9_':'mm9', 'rn4_':'rn4'}
    with open(alignfilename) as openfile:
        lines = line_generator(openfile)
        line = lines.next()
        while line:
            if line[1:11] in id_dict.keys():
                name = line[12:19]
                if name[0:4] in name_dict.keys():
                    name = name_dict[name[0:4]]
                alignid = line[1:11]
                print alignid, id_dict[alignid]
                line1 = line[0:19]
                line2 = lines.next()
                line2 = line2.strip('\n')
                name = str('>'+name)
                geneid = id_dict[alignid]
                align_dict[geneid][name]+= line2
                line =lines.next()
            else:
                line = lines.next()
    return align_dict

# Write converted alignment output into .fa file
def write_maf(align_dict, aligntype):
    for key in align_dict:
        name = str(key.strip()+'_'+aligntype+'_align.fa')
        out = open(name, 'w')
        human = align_dict[key]['>hg19']
        human = human[0:len(human)-3]
        out.write('%s\n%s\n' % ('>hg19',human))
        del align_dict[key]['>hg19']
        for sp in align_dict[key]:
            seq = align_dict[key][sp]
            seq = seq[0:len(seq)-3]
            out.write('%s\n%s\n'% (sp,seq))   #Removes stop codon positions
        out.close()




main()
