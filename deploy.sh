#!/bin/bash

set -e


echo "Updating local copy..."
git pull origin master:master

echo "Updating readme..."
git checkout master
echo "Deploy: `date`" >> README.md
git add README.md
git commit -m "auto-deploy"
git checkout development

echo "Configuring git remotes..."
git remote add deploy git@github.com:eliasdorneles/citesting.git || echo "Deploy already exists:"
git remote -v

echo "Restoring key..."
mkdir -p .travis
openssl aes-256-cbc -K $encrypted_ef748fe1608c_key -iv $encrypted_ef748fe1608c_iv \
    -in deploy_key.pem.enc -out .travis/deploy_key.pem -d

echo "Adding key..."
chmod 600 .travis/deploy_key.pem
eval $(ssh-agent)
ssh-add .travis/deploy_key.pem

echo "Pushing to master..."
git push --force deploy master:master
