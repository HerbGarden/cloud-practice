ii=$(date +"%m%d")
ie=$(whoami)
history > $ii$ie.txt
cp $ii$ie.txt /mnt/hgfs/share/.
mv $ii$ie.txt ~/git/history/.
cd ~/git
git fetch
git pull origin master
git add -A
git commit -m "history update"
git push
