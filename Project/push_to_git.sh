# print some thing
echo "**** Pushing all the DIRs to GIT Remote repo in Current DIR ****"

#cd ~/${pwd}/

# List all the DIRs in the current DIR and Log it to file
ls -d */ > lsOutput.txt

# Reading the DIR names in an array line by line
arr=()
while IFS= read -r line; do
	arr+=("$line")
done <lsOutput.txt

# Looping over DIR names array
for ((i=0; i < ${#arr[@]}; i++))
do
	# Print DIR Name
	echo "${arr[i]}"
	# Assign DIR var with DIR name
	DIR="${arr[i]}"
	# Check if DIR Exists or Not
	if [ -d "$DIR" ]; then
		# Go to the DIR 
		cd $(echo "${arr[i]}")
		echo "****************** PWD : $(pwd) ************************** "
		# Check if git is initilized or not
		if [ -d .git ]; then
			if [[ "$(git push -u origin master )" == *"Done"* ]]; then
				echo "GIT PUSH WAS SUCCESSFULL"
			fi
			echo "Has git initilized"
			echo "REMOTE URL: $( git config --get remote.origin.url )"
			echo "###################################################"
		else
			echo "Does not has git initilized"
		fi;
		cd ..
		
	fi
	
done


