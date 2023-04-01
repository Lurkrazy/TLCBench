# squeue -u u0940848
#!/bin/bash

while true
do
    squeue -u u0940848 | grep -E 'PD|R'
    sleep 3
done
