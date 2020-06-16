#!/bin/bash

KG_VERSION=$1

mkdir /d
cd /d/

wget http://etna.istc.cnr.it/arco-data/${KG_VERSION}/index.txt

while read in; do wget "http://arco.istc.cnr.it/arco-data/${KG_VERSION}/$in"; done < index.txt

i=1
for f in *.nt.gz; 
do
echo creating directory: $i
mkdir $i
mv $f $i
((i=i+1))
done

rm index.txt
  
