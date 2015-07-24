#!/bin/bash

echo "Starting Prep"
unzip DSGen_v1.1.0.zip
cd ./tools/ 
make
cp dsdgen ../
cp tpcds.idx ../
cp dsqgen ../

cd ../../
nohup gpfdist -d ./ -p 7000 -l /home/gpadmin/log -m 1048576 &
echo "Finished Prep"

exit
