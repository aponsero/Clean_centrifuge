#!/bin/sh
set -u
#
# Checking args
#

source scripts/config.sh

if [[ ! -d "$RESULT_DIR" ]]; then
    echo "$RESULT_DIR does not exist. Run ./split.sh to create the directory and the split files."
    exit 1
fi

#
# Job submission
#

PREV_JOB_ID=""
ARGS="-q $QUEUE -W group_list=$GROUP -M $MAIL_USER -m $MAIL_TYPE"

#
## 02- run kmerFrequency calculation
#

PROG1=""

export STDERR_DIR1="$SCRIPT_DIR/err/$PROG1"
export STDOUT_DIR1="$SCRIPT_DIR/out/$PROG1"

init_dir "$STDERR_DIR1" "$STDOUT_DIR1"

if [ "$TYPE" == "viral" ]; then
        export READTYPE=1
else
        export READTYPE=0
fi
