#!/bin/sh

git config user.name "somonus"
git config user.email "312677182@qq.com"

git filter-branch --env-filter '

OLD_EMAIL="oldxxx@old.com"
CORRECT_NAME="somonus"
CORRECT_EMAIL="312677182@qq.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git push -f
