#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage : $0 <mame-xml>"
  exit 1
fi

if [[ -x `which xmllint` ]]; then
  for i in templates/*.xsl; do
    TEMPLATENAME=`basename -s .xsl $i`
    OUTPUTFILE="output/$(basename -s .xml $1)_${TEMPLATENAME}.xml"
    echo "${OUTPUTFILE} contains $(xmllint --xpath "count(/mame/machine)" ${OUTPUTFILE}) machines." 
  done
else
  echo "xmllint is required to create reports. On Debian, this tool is included in the libxml2-utils package."
fi
