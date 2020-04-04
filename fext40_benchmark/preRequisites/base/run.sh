#!/bin/bash

if [ ! -d run_1 ]
then
    echo "run dirs were not meshed yet. Run first:"
    echo "./mesh_runs.sh"
    exit 1
fi

nums=$(cat thread_numbers.input)
revnums=$(python helper_scripts/reverse.py)

# Run cases
for i in $revnums;do
    echo "Run for ${i}..."
    cd run_$i
    if [ $i -eq 1 ] 
    then
        simpleFoam > log.simpleFoam 2>&1
    else
        mpirun -np ${i} simpleFoam -parallel > log.simpleFoam 2>&1
    fi
    echo $i `grep Execution log.simpleFoam | tail -n 1 | cut -d " " -f 3`
    cd ..
done

# Extract times
echo "# cores   Wall time (s):"
echo "------------------------"
for i in $nums; do
    echo $i `grep Clock run_${i}/log.simpleFoam | tail -n 1 | cut -d " " -f 8`
done

 
 
