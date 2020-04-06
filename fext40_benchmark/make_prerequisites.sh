#!/bin/bash
echo "copying $WM_PROJECT $WM_PROJECT_VERSION motorBike essentials"
cp -rv $WM_PROJECT_DIR/tutorials/incompressible/simpleFoam/motorBike .
rm -f motorBike/All* motorBike/blockMeshDict
cp -rv preRequisites/extendedFeatureEdgeMesh motorBike/constant/
cp -v preRequisites/motorBike.eMesh.gz motorBike/constant/triSurface/
cp -v preRequisites/blockMeshDict motorBike/constant/polyMesh/
cp -v preRequisites/system/* motorBike/system/
cp -v preRequisites/base/* .
if [ $WM_PROJECT == "OpenFOAM" ];then mv motorBike/system/controlDictOF motorBike/system/controlDict;fi
