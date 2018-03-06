#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

if [[ ! -f "$FASTA" ]]; then
    echo "$FASTA does not exist. Please submit a Fasta file to clean. Job terminated."
    exit 1
fi

if [[ ! -d "$OUTDIR" ]]; then
    echo "$OUTNAME not provided. Please correct specified parameter in config file. Job terminated."
    exit 1
fi

if [[ ${#TYPE} -lt 1 ]]; then
  echo "Incorrect training set type value. Please correct specified parameter in config file. Job terminated."
  exit 1
fi

if [[ ! -d "$OUTDIR" ]]; then
    echo "$OUTDIR does not exist. The directory was created."
    mkdir $OUTDIR
fi


#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 02- run kmerFrequency calculation
#

PROG1="run_centrifuge"

export STDERR_DIR1="$SCRIPT_DIR/err/$PROG1"
export STDOUT_DIR1="$SCRIPT_DIR/out/$PROG1"

init_dir "$STDERR_DIR1" "$STDOUT_DIR1"

if [ "$TYPE" == "viral" ]; then
        export EXCLUDE="10239"
elif [ "$TYPE" == "bacterial" ]; then
        export EXCLUDE="2,2157,2759"
else
    echo "the type of data provided is not correct. Please correct the type parameter in config file. Job terminated."
    exit 1
fi
