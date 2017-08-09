#!/bin/bash

[ -z "$1" ] && {
    echo "Usage: $0 <source_file.S>"
    exit 1
};

FILE=${1%.S}
# build
as -o ${FILE}.o ${FILE}.S && \
    ld -o ${FILE} ${FILE}.o

# clean
rm -f ${FILE}.o

file $FILE
