#! /bin/bash

echo '[google-chrome]' > /etc/yum.repos.d/google-chrome.repo
echo 'name=google-chrome ' >> /etc/yum.repos.d/google-chrome.repo
echo 'baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch' >> /etc/yum.repos.d/google-chrome.repo
echo 'enabled=1' >> /etc/yum.repos.d/google-chrome.repo
echo 'gpgcheck=1' >> /etc/yum.repos.d/google-chrome.repo
echo 'gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub' >> /etc/yum.repos.d/google-chrome.repo

yum install -y google-chrome-stable

sed -i 's/\"\$\@\"/\"\$\@\" \-\-no\-sandbox \-\-user\-data\-dir/' /usr/bin/google-chrome

