#!/bin/bash

#declare associative array
declare -A team

#initialize table
team[member1]="andriej comorowsky"
team[member2]="kryspin gitowsky"

echo "Team members: "
#get values
echo "1: ${team["member1"]}"
echo "2: ${team["member2"]}"

#get indexes
echo -e "\nIndexes in the associative array are: ${!team[*]}"

#print count of the entries  in the table
echo -e "\nEntries count: ${#team[*]}"
