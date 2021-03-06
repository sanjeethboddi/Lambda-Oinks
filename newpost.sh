#!/bin/sh

# Requires hub: brew install hub; alias git=hub
# to run: ./newpost [REPO NAME] [POST TITLE]

DIR=`date +%F`-$1

hub create lambda-oinks/$1
sleep 3

(cd ~/lambda-oinks/posts
hub clone lambda-oinks/$1

(cd $1
echo "---" >> index.md
echo "title: $2" >> index.md
echo "date: `date +%F`" >> index.md
echo "author: Oinkina" >> index.md
echo "---" >> index.md
git add index.md
git commit -a -m "initialized with template for index.md"
git push origin master
)

rm -rf ~/lambda-oinks/posts/$1
git submodule add -b master git@github.com:lambda-oinks/$1 $DIR
git commit -a -m "added new post submodule: $DIR"
git push origin master
)

#(cd ~/lambda-oinks/posts/$DIR
#git remote add origin git@github.com:lambda-oinks/$1
#)

(cd ~/lambda-oinks
git add .
git commit -a -m "added new post submodule within posts/: $DIR"
git push origin master
)