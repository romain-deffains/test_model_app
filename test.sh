checkout=0
user="Dowwind"
pass="Dowwind15011997"

git branch > bite
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
	send "$user"
	send "$pass"
	git push origin line
	git checkout master
    fi
done < bite
rm bite
