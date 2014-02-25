#!/bin/sh

set -e
set -x

demo="demo_hub"
NEWS=NEWS

rm -rf $demo
git init $demo
cd $demo

hub create

echo "/$NEWS merge=union" > .gitattributes
git add .gitattributes
git commit -m "specify union merge for NEWS file"

touch $NEWS
git add $NEWS
git commit -m "added $NEWS"

echo "Common contents" >> $NEWS
echo "Common contents" >> $NEWS
echo "Common contents" >> $NEWS
git add NEWS
git commit -m "added common contents"
git push -u origin master

git checkout -b a master
echo "Contents from a" >> $NEWS
git add $NEWS
git commit -m "added contents from a"
git push -u --all

PULLREQ_A_URL=$(hub pull-request -m "merge added contents from a")

git checkout -b b master
echo "Contents from b" >> $NEWS
git add $NEWS
git commit -m "added contents from b"
git push -u --all

PULLREQ_B_URL=$(hub pull-request -m "merge added contents from b")

git checkout master
hub merge $PULLREQ_A_URL
hub merge $PULLREQ_B_URL
