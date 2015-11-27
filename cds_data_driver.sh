#! /bin/bash
###################################################################################################
## Driver script for generating sitewise, CDS phyloP data from a list of amino acid sequences
## Args: $1 = name of .fasta file containing amino acid sequences
## Author: kjwade
## Created: 11/19/2015
###################################################################################################

# Matches human amino acid sequences to hg19 protein sequence database, extracts knownGene coordinate information
# Output: human_aa_data.txt
python ucsc_gene_data.py $1
echo 'NCBI protein sequence to UCSC hg19 knownGene data conversion complete.'

# Parses knownGene.exonNuc.fa for protIDs from previous output, extracts aligned exon sequence and 
# converts the alignment format to .fa
# Output: one, 46way alignment (.fa) file for each protein's nucleotide coding sequence
python cds_parse.py knownGene.exonNuc.fa human_aa_data.txt 46way
echo 'CDS alignment extraction complete.'

# Iterates through newly generated alignment files, calls phyloP
# Output: three sitewise phyloP .wig files for each gene, one for each phylogenetic depth
sh phylop_run.sh
echo 'phyloP run complete.'