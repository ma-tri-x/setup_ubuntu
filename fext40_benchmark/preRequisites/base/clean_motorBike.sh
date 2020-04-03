#!/bin/sh

# Source tutorial clean functions
. $WM_PROJECT_DIR/bin/tools/CleanFunctions

cd motorBike

cleanCase
\rm -rf constant/polyMesh
mkdir constant/polyMesh
\cp -f ../preRequisites/blockMeshDict constant/polyMesh/
\rm -f constant/*.gz
