#! /bin/bash
###################################################################################################                         
## Driver script for generating sitewise, intron phyloP data from a list of hg19 genome feature coordinates 
## Args: $1 = human_aa_data.txt                                                                                            
## Author: kjwade                                                                                                           
## Created: 11/19/2015                                                                                                      
################################################################################################### 

# Extracts each gene's exon boundary information to generate a .bed file of intron coordinates  
# output: one .bed coordinate file containing chr#\tstart\tstop position from which to extract alignment data, per gene     
python intron_extract.py $1
echo 'intronic .bed coordinate files generated.'                                                               

# Iterate through newly generated .bed coordinate files, call mafsInRegion to extract 46way alignment into .maf, call phyloP
# output: three sitewise phyloP LRT files for each gene's intronic sequences, one file for each phylogenetic depth 
for f in *intron_coords.bed;
do sh maftophylop.sh $f "intron";
done;
echo 'Done with intron alignment extraction and phyloP LRT estimation.'


