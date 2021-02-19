#!/bin/sh

# If a command fails then the deploy stops
set +e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder

git add . 
git commit -m "update post"
git push 

# rm -rf ~/桌面/davidleitw.github.io/*
# printf "after rm -rf\n"
ls ~/桌面/davidleitw.github.io/
cp -r public/. ~/桌面/davidleitw.github.io
printf "after cp -r \n"
ls ~/桌面/davidleitw.github.io/
cd ~/桌面/davidleitw.github.io/

# rm -rf temp/*
# ls temp
# cp -r public/. ./temp/
# ls temp


git status
git add .

msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"


git push origin master