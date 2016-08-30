set checkout

git branch > branch_list
while read line
do
    checkout=0
    echo "la ligne dans branch_list est : "
    echo $line
    for letter in $line
    do
	echo "les lettre sont : "
	echo $letter
	if [ $letter = '*' ]
	then
	    checkout=1
	fi
    done
    if [ $checkout = 0 ]
    then
	git checkout $line
	git pull origin master
	git add .
	git commit -m "Rebase branch"
	git push origin $line
	git checkout master
    fi
done < branch_list
rm branch_list
