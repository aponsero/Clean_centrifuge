#!/bin/bash

#PBS -l select=1:ncpus=12:mem=23gb
#PBS -l walltime=24:00:00
#PBS -l cput=24:00:00

PATH=$PATH:/rsgrps/bhurwitz/alise/tools/centrifuge/bin
export PATH

export CENT_DB="/rsgrps/bhurwitz/alise/my_data/databases/Centrifuge_DB/pre-built/p_compressed+h+v"
export FILE_TYPE="f"

centrifuge -x $CENT_DB -U $FASTA -S $OUT-centrifuge_hits.tsv --report-file $OUT-centrifuge_report.tsv -$FILE_TYPE --exclude-taxids $EXCLUDE  -p 12

