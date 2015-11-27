#! /bin/bash
###################################################################################################                         
## Driver script for generating sitewise, upstream phyloP data from a list of hg19 genome feature coordinates          
## Args: $1 = human_aa_data.txt                                                           
## Author: kjwade                                                                                                           
## Created: 11/19/2015                                                                                                      
################################################################################################### 

# Extracts each gene's CDSstart coordinate and strand information to generate a .bed file of 35kb upstream coordinates
# output: one .bed coordinate file containing chr#\tstart\tstop position from which to extract alignment data, per gene     
python gene_coords_extract.py $1
echo 'upstream .bed coordinate files generated.'

# Iterate through newly generated .bed coordinate files, call mafsInRegion to extract 46way alignment into .maf, call phyloP
# output: three sitewise phyloP LRT files for each gene's upstream 35kb region, one file for each phylogenetic depth
for f in *upstream_coords.bed;
do sh maftophylop.sh $f "upstream";
done; 
echo 'Done with upstream alignment extraction and phyloP LRT estimation.'