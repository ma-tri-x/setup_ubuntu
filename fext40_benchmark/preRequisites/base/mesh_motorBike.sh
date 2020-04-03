#!/bin/bash
# Source tutorial run functions
. $WM_PROJECT_DIR/bin/tools/RunFunctions

if [[ -e motorBike/constant/polyMesh/points || -e motorBike/constant/polyMesh/points.gz ]]
then
    echo "was already meshed. Maybe clean_motorBike.sh again?"
    echo "But be aware that snappy will be exec. on 1 thread!"
    exit 1
fi

cp preRequisites/blockMeshDict motorBike/constant/polyMesh/

cd motorBike

runApplication blockMesh
runApplication snappyHexMesh -overwrite
cd ..
#\rm -rf constant/polyMesh
#\mv 3/polyMesh constant
#\rm -rf 1 2 3
#runApplication simpleFoam
