checkout=0
user="Dowwind"
pass="Dowwind15011997"

git branch > branch_list
while read line
do
    $checkout=0
    for letter in $line
    do
	if [ $letter = '*' ]
	then
	    $checkout=1
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
