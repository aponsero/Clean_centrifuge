# Clean_centrifuge
Cleaning pipeline for machine learning application using Centrifuge. This pipeline will run centrifuge on an imput fasta file, then parse the results to remove viral or prokarotic hits from the dataset.
This script is intended to be run on an HPC with a PBS scheduler.

## Requirements

### Centrifuge
This pipeline necessites to download and install [Centrifuge](https://github.com/infphilo/centrifuge) on the HPC. 

## Quick start

### Edit scripts/config.sh file

please modify the

  - FASTA = indicate here the path to imput fasta file
  - TYPE = indicate here the type of data to clean (if "viral" is chosen, all non-viral hit will be removed from the dataset. On the contrary, if "bacterial" is chosen all non-prokaryotic hits will be removed)
  - OUT_DIR = indicate here the path to the output directory
  - OUTNAME = indicate here the name to use for the output files
  - MAIL_USER = indicate here your arizona.edu email
  - GROUP = indicate here your group affiliation

You can also modify

  - BIN = change for your own bin directory.
  - MAIL_TYPE = change the mail type option. By default set to "bea".
  - QUEUE = change the submission queue. By default set to "standard".
  
  ### Run pipeline
  
  Run 
  ```bash
  ./submit.sh
  ```
  This command will place two jobs in queue.
  
