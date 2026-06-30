PROJECT_URL='https://github.com/ahmed-ghallap/git-course-demo-1.git'
REMOTE_NAME='origin'
BRANCH_NAME='main'

#to create a repo on github go to 'repo.new'

git_init: git_add_user_and_email
	git config --global init.defaultBranch $(BRANCH_NAME)

git_add_user_and_email: 
	git config --global user.name 'ahmed-ghallap'
	git config --global user.email 'ahmed.m.ghallap@gmail.com'
git_show_config:
	git config --list | less
git_show_config_file_path:
	#show where the ~/.config file is
	git config --list --show-origin
git_status:
	git status
git_create_repo: git_init
	# go to website toptal for .gitignore templates
	git init && touch .gitignore  
	touch Readme.txt && echo "Hello, this is a new repo" >> Readme.txt
	git status

git_clone_project:
	git clone $(PROJECT_URL)
git_create_branch:
	git branch -M $(BRANCH_NAME)
git_init_remote:
	git remote add $(REMOTE_NAME)  $(PROJECT_URL)
	git remote -v
git_push: git_init_remote git_create_branch
	git push -u $(REMOTE_NAME) $(BRANCH_NAME)

git_push_latest:
	git add .
	git commit -m 'comment'
	git push

git_rename_remoteName:
	git remote -v
	git remote rename $(REMOTE_NAME) base

git_change_branch_to_main:
	git branch -m $(BRANCH_NAME)
log:
	git log --oneline
diff:
	git diff main origin/main
git_add_files_to_last_commit:
	git commit --amend --no-edit
git_change_commit_message:
	# search on internet for conventional commits formats
	git commit --amend -m "new message"

git_create_branch:
	git branch
