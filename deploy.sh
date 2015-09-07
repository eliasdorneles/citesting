#!/bin/bash

set -e


echo "Updating local copy"
git pull origin master:master
echo "Testing deploy"
echo "Deploy: `date`" >> README.md
git add README.md
git commit -m "auto-deploy"

echo "git remote -v"
git remote -v
# git remote add deploy https://github.com/eliasdorneles/citesting.git || echo "Deploy already exists, whatever..."
# git remote -v

echo "Pushing to master..."
git push origin master:master
