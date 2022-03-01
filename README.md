# How to Add, Commit and Push All the Project in PWD to remote GITHUB Repositories

### Example:
I have a Projects dir where I have all my projects, and remote git repository is linked to every project. I don't want to navigate
to each project dir to push it to remote repository so in this scenario, you can use this shell/bash script to push all the
projects to their respective remote repositories at once.

```bash
Folder PATH listing
Volume serial number is C80A-3BD9
C:./Projects
├───Project_1
├───Project_2
├───Project_3
└───Project_4
```

#### Prerequisite Configuration
You need to configue your git befor using 

```
//add username
git config --global user.name "your_username"

//add email
git config --global user.email "your_email_address@example.com"

//check configuration
git config --global --list
```

#### Steps to Execute the Script

