checkout=0

while read line
do
    $checkout=0
    echo $line
    for letter in line
    do
	if [ $letter = '*' ]
	then
	    echo "J'ai trouvé *.\n"
	    $checkout=1
	fi
    done
    if [ $checkout = 0 ]
    then
	echo "Commande git.\n"
	git checkout line
	git pull origin master
	git add .
	git commit -m "Rebase branch"
	git push origin line
	git checkout master
    fi
done < bite