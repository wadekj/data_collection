####################################################################################################
## Wrapper script to call driver scripts that generate sitewise, phyloP LRT data for each gene 
## at all three phylogenetic depths: Vertebrate (46way), Mammal, Primate.
## Input: $1: User-compiled fasta file of amino acid sequences for proteins of interest.
## NOTE: Use of UCSC tool mafsInRegion is very memory intensive. Recommended use on HPC cluster such
## as GridEngine via qsub.
## Author: kjwade
## Created: 11/16/2015
####################################################################################################
#! /bin/bash

# Generate CDS LRT data based on hg19 protein coding data (human_aa_data.txt)                  
# Output: 
# - one 46way nucleotide alignment (.fa) for each coding sequence
# - three phyloP LRT (.wig) files for each protein's nucleotide sequence, one for each depth, 
# - One file containing all genome coordinate information of relvant protein features (human_aa_data.txt)  
sh cds_data_driver.sh $1

# Generate upstream LRT data based on hg19 protein coding data (human_aa_data.txt)                  
# Output: 
# - one 46way alignment (.maf) for each upstream sequence
# - three phyloP LRT (.wig) files for each gene's upstream sequence, one for each depth  
sh upstream_data_driver.sh human_aa_data.txt

# Generate intronic LRT data based on hg19 protein coding data (human_aa_data.txt)
# Output: 
# - one 46way alignment (.maf) for each gene-wise intron
# - three phyloP LRT (.wig) files for each gene's introns, one for each depth
sh intron_data_driver.sh human_aa_data.txt


