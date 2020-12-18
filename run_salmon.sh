#!/bin/bash

#activate correct conda environment
#conda activate MSA_alignment

GEO=$(uniq GEO_accession.txt |cat )

for i in ${GEO}
	do
		echo  ${i} #this is GEO identifier
		fasta=$( grep ${i} SraRunTable.txt | cut -d ','  -f 1 | sed 's/$/.fastq.gz /' ) #grep patterns, extract 1st column, append file extension (sub end of stirng with fastq) 
		echo ${fasta}
		echo "running salmon for ${i}...."
		echo "salmon quant -i gencode_v35_index -l A -r ${fasta}  -o ./salmon_output/${i}.transcripts_quant" # -l A is autodetect library type (PE or SE)
		salmon quant -i gencode_v35_index -l A -r ${fasta}  -o ./salmon_output/${i}.transcripts_quant
	done
