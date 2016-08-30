#!/bin/bash

trim() {
  local s2 s="$*"
  until s2="${s#[   ]}"; [ "$s2" = "$s" ]; do s="$s2"; done
  until s2="${s%[   ]}"; [ "$s2" = "$s" ]; do s="$s2"; done
  echo "$s"
}

old_IFS=$IFS
IFS=$'\n'
set checkout

git branch > branch_list
for line in $(cat branch_list)
do
    checkout=0
    if [[ $line == *"*"* ]]
    then
	checkout=1
    fi
    if [ $checkout = 0 ]
    then
	line=$(trim "$line")
    	git checkout $line
    	git pull origin master
    	git add .
    	git commit -m "Rebase branch"
    	git push origin $line
    	git checkout master
    fi
done
rm branch_list
