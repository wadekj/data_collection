#!/usr/bin/env bash
###########################################################################
## Script to extract alignment data for upstream and introns, call phyloP
## Input args: $1 - ith gene.bed file $2 - region, "upstream" or "intron"
## Author: kjwade
## Created 6/7
##########################################################################
GENE="$(echo $1 | cut -d "_" -f 1,1)"   #Extracts GENE                           
CHR="$(cut -d$'\n' -f 1,1 $1 | cut -f 1,1 | cut -d ' ' -f 2,2)"    # Extract xsome 'chr#'                                

./mafsInRegion $1 $GENE'_'$2'_46way.maf' $CHR'.maf'

echo "Done extracting .maf for $GENE"
# Call phyloP
phyloP --wig-scores --method LRT vertebrate.mod $GENE'_'$2'_46way.maf' > $GENE'_'$2'_46way.wig'
phyloP --wig-scores --method LRT primates.mod $GENE'_'$2'_46way.maf' > $GENE'_'$2'_primate.wig'
phyloP --wig-scores --method LRT placentalMammals.mod $GENE'_'$2'_46way.maf' > $GENE'_'$2'_mammal.wig'

