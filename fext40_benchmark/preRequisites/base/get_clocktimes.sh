# Extract times
echo "# cores   Wall time (s):"
echo "------------------------"
for i in run_*; do
    echo $i `grep Execution ${i}/log.simpleFoam | tail -n 1 | cut -d " " -f 8`
done
