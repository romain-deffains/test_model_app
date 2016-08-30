#!/bin/bash

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
    	git checkout $line
    	git pull origin master
    	git add .
    	git commit -m "Rebase branch"
    	git push origin $line
    	git checkout master
    fi
done
rm branch_list
