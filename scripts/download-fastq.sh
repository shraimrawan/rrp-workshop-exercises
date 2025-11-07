#!/bin/bash

set -euo pipefail

#Set working directory to this files directory 
cd "$(dirname "${BASH_SOURCE[0]}")"

# "Constant" variable 

study_id="SRP255885"
fastq_url="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889/"
fastq_r1="SRR11518889_1.fastq.gz"
fastq_dir="../data/raw/fastq/$study_id"

#create the fastq directory 
mkdir -p fastq_dir

# Print an indicator:
echo "Obtaining $fastq_r1"

# Curl the file (using one of several approaches)
curl -O $fastq_url/$fastq_r1 # this approach preserves the original internet file name

# Explore: how many lines are in the file?
echo "The number of lines in $fastq_r1 is:"
gunzip -c $fastq_r1 | wc -l


# Move the file to its destination directory
mv $fastq_r1 $fastq_dir



