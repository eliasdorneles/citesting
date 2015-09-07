#!/bin/bash

set -e


echo "Updating local copy"
git pull origin master:master
echo "Testing deploy"
echo "Deploy: `date`" >> README.md
git add README.md
git commit -m "auto-deploy"

git remote add deploy https://github.com/eliasdorneles/citesting.git || git remote -v

git push deploy master:master
