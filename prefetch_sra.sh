#!/bin/bash

#get input
SRA=$(cat sra_accession.txt)

#download data 

for i in ${SRA}
	do
		prefetch ${i}
		
		if [ -f ${i}.fastq.gz ] #if the fastq file exists
			then
				echo "${i} already downloaded"
		else
				echo "${i}.sra conversion to fastq... "
				fastq-dump --gzip --defline-qual '+' ${i}/${i}.sra
				echo "${i} conversion complete"		

		#delete sra files?

		fi

	done 


