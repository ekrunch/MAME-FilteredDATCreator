#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage : $0 <mame-xml>"
  exit 1
fi

mkdir -pv output/

for i in templates/*.xsl; do
  TEMPLATENAME=`basename -s .xsl $i`
  echo Processing ${TEMPLATENAME}
  xsltproc -o output/`basename -s .xml $1`_${TEMPLATENAME}.xml $i $1
done
