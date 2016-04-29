#!/bin/sh

if [ $# -eq 3 ]
then
  export OLD_EMAIL=$1
  export CORRECT_NAME=$2
  export CORRECT_EMAIL=$3
  echo "Changing $OLD_EMAIL to <$CORRECT_NAME $CORRECT_EMAIL>"
else
  echo 'Usage: danger_change_git_author.sh wrong@email.com "New Name" correct@email.com'
  exit
fi


git filter-branch --env-filter '

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
'  -- --branches
