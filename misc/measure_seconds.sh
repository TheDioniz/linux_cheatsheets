#!/bin/bash
start=$(date +%s)

#commands
sleep 2

end=$(date +%s)
difference=$(( end - start))
echo Time taken to execute commands is $difference seconds.
