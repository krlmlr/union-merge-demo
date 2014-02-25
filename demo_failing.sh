#!/bin/sh

set -e
set -x

demo="demo_failing"
NEWS=NEWS

rm -rf $demo
git init $demo
cd $demo

touch $NEWS
git add $NEWS
git commit -m "added $NEWS"

echo "Common contents" >> $NEWS
echo "Common contents" >> $NEWS
echo "Common contents" >> $NEWS
git add NEWS
git commit -m "added common contents"

git checkout -b a master
echo "Contents from a" >> $NEWS
git add $NEWS
git commit -m "added contents from a"

git checkout -b b master
echo "Contents from b" >> $NEWS
git add $NEWS
git commit -m "added contents from b"

git checkout master
git merge --no-ff --no-edit a
git merge --no-ff --no-edit b

