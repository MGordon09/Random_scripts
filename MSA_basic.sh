#!/bin/bash

#activate correct conda environment
#conda activate MSA_alignment

VAR=$(cat uniprot_id.txt)

URL="https://www.uniprot.org/uniprot/"

for i in ${VAR} 
	do
		echo 'Downloading Uniprot entry: ${i}' 
		wget -P /Users/martingordon/Desktop/Lockdown_Learning/Wk3/uniprot_fasta/ ${URL}${i}.fasta #could put as argument to specify the directory
		echo ' ${i}  Download Complete '  
		
	done


echo 'Merging FASTA files...'
cat ~/Desktop/Lockdown_Learning/Wk3/uniprot_fasta/*.fasta > merged.fasta

echo 'Running MUSCLE on' $(ls /Users/martingordon/Desktop/Lockdown_Learning/Wk3/uniprot_fasta/ | wc -l) 'files in "Uniprot_fasta" folder'
muscle -in  merged.fasta -out muscle_output -clw #REDIRECT OUTPUT TO ANOTHER FOLDER

echo 'MSA complete'










