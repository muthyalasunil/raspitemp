#!/bin/bash

git fetch >> /dev/null
git reset --hard HEAD >> /dev/null
git merge origin/main >> /dev/null

