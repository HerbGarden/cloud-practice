#! /bin/bash

yum install -y git
cd /
mkdir git
cd git
git init
git config --global user.name "herbgarden"
git config --global user.email "vksxkwl65@gmail.com"
git remote add origin https://github.com/HerbGarden/cloud-practice.git
git pull origin master
