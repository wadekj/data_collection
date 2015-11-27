######################################################################################################################################
Pipeline for generating sitewise phyloP LRT data based on human amino acid protein sequences.
- Converts human amino acid protein sequences to nucleotide alignments based on 46, vertebrate species.
- Uses Vertebrate, Mammal and Primate phylogenetic trees to produce nucleotide phyloP LRT scores of 
protein-coding, 35kb upstream and intronic regions corresponding to original human protein sequence information.
 
- Coordinate system based on amino acid sequence match to hg19/GRCh37 assembly, Annotation Release 104-November 2012. (Lander, E. S., 
Linton, L. M., Birren, B., Nusbaum, C., Zody, M. C., Baldwin, J., ... & Grafham, D. (2001). Initial sequencing and analysis 
of the human genome. Nature, 409(6822), 860-921.)

Built in support of manuscript in prepartion for publication by the lab of Brian Verrelli, Ph.D., Department of Biology,
Virginia Commonwealth University.

Author: kjwade
Last edited: 11/25/2015
#######################################################################################################################################

Usage:
$ sh main.sh <human_aminoacid_seqs.fasta>


**Additional required downloads/published software**:

Multiz46way alignment of known human exon sequences: 
- Blanchette, M., Kent, W. J., Riemer, C., Elnitski, L., Smit, A. F., Roskin, K. M., ... & Miller, W.(2004).
  Aligning multiple genomic sequences with the threaded blockset aligner. Genome research, 14(4), 708-715.
- ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/multiz46way/alignments/ 

- Multiz46way full chromosome .maf alignments for chromosomes on which desired genes occur:
	- ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/multiz46way/maf/ 

phyloP: 
- Pollard, K. S., Hubisz, M. J., Rosenbloom, K. R., & Siepel, A. (2010). 
  Detection of nonneutral substitution rates on mammalian phylogenies. Genome research, 20(1), 110-121.
- http://compgen.cshl.edu/phast/help-pages/phyloP.txt 
- http://compgen.cshl.edu/phast/index.php 

- Tree files- vertebrate.mod, placentalMammals.mod, primate.mod: 
	- ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/phyloP46way/ 


UCSC GenomeBrowser tool mafsInRegion:
- Kent WJ, Sugnet CW, Furey TS, Roskin KM, Pringle TH, Zahler AM, Haussler D. 
  The human genome browser at UCSC. Genome Res. 2002 Jun;12(6):996-1006 
- http://hgdownload.cse.ucsc.edu/admin/exe/ 



