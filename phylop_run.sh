#! bin/bash
## Script to iterate through alignment file generated for CDS data and call phyloP for each tree
# Output: three .wig files per gene, one for each tree
## Author: kjwade
## Created 4/28/15
##############################################################################################

for f in *46way_align.fa;
do 
GENE="$(echo $f | cut -d "_" -f 1,1)"   #Extracts GENE 
phyloP --wig-scores --method LRT vertebrate.mod $f > $GENE"_cds_46way.wig"
phyloP --wig-scores --method LRT placentalMammals.mod $f > $GENE"_cds_mammal.wig"
phyloP --wig-scores --method LRT primates.mod $f > $GENE"_cds_primate.wig";
done;