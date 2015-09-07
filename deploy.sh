#!/bin/bash

echo "Updating local copy"
git pull origin master:master
echo "Testing deploy"
echo "Deploy: `date`" >> README.md
git add README.md
git commit -m "auto-deploy"
git push origin master:master
