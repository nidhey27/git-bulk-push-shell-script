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
			git add .
			git commit -m "Auto Commit using Shell Script"
			if [[ "$(git push -u origin master )" == *"Done"* ]]; then
				echo "GIT PUSH WAS SUCCESSFULL"
			fi
			echo "Has git initilized &"
			echo "REMOTE URL: $( git config --get remote.origin.url )"
			echo "-------------------------------------------------------"
		else
			echo "GIT NOT INITILIZED"
			echo "Do You want to add remote repo? (y/n)"
			read -r answer
			if [ "$answer" = "y" ]; then
				echo "Enter the remote repo URL"
				read -r remote_url
				git init
				git remote add origin $remote_url
				git add .
				git commit -m "Initial commit using shell script"
				if [[ "$(git push -u origin master )" == *"Done"* ]]; then
					git push -u origin master
					echo "REMOTE URL: $( git config --get remote.origin.url )"
					echo "-------------------------------------------------------"
				else
					continue
				fi
			fi
		fi
		cd ..
		
	fi
	
done


