# setup_ubuntu
taking notes how I set up ubuntu 18.04 on an AMD ryzen 3950x, ASRock570 pro4, m2 ssd

# OpenFoam and Foam Extend benchmark
I created a benchmark case dedicated to 
https://www.cfd-online.com/Forums/hardware/198378-openfoam-benchmarks-various-hardware-14.html
but capable of being used with foam-extend-4.0 and presumably any OpenFoam / foam-extend version.

usage:
```
cd fext_benchmark
source $HOME/foam/foam-extend-4.0/etc/bashrc
# it copies the tutorial case and fills it with necessary files that were generated with OF-7:
./make_fext40_prerequisites.sh 
./mesh_motorBike.sh
./mesh_runs.sh
./run.sh
```
