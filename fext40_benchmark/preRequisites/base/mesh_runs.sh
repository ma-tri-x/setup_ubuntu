#!/bin/bash
# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

if [[ ! -e motorBike/constant/polyMesh/points && ! -e motorBike/constant/polyMesh/points.gz ]]
then
    echo "motorBike needs to be meshed first, bec. snappy is"
    echo "buggy in parallel exec.. Run: ./mesh_motorBike.sh   "
    exit 1
fi

nums=$(cat thread_numbers.input)
revnums=$(python helper_scripts/reverse.py)

# Prepare cases
for i in $revnums;do
   d=run_$i
   echo "Prepare case ${d}..."
   cp -r motorBike $d
   cd $d
   if [ ! $i -eq 1 ] 
   then
        sed -i "s/method.*/method scotch;/" system/decomposeParDict
        sed -i "s/numberOfSubdomains.*/numberOfSubdomains ${i};/" system/decomposeParDict
        rm -rf proc* log.*
        echo "decomposing..."
        decomposePar > log.decomposePar 2>&1
        echo "end of log.decomposePar:"
        echo "---------" 
        tail -n 10 log.decomposePar
   fi
   cd ..
done
