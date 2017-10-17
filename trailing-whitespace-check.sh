#!/bin/bash 
# Script that runs 

INTRO="Hi! I'm an automated TravisCI build script bot that reports PR typos.  
If your PR has typos the build will continue neverthless, *but*  
we ask you to please provide a follow-up fix. FYI sometimes I report false positives. 
"

# For colorizing output. When using them, we need to terminate with $NC to reset back to default  
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;36m'
NC='\033[0m' # No Color 

# Round up all changed content 
CHANGED_FILES=($(git diff --name-only $TRAVIS_COMMIT_RANGE)) 

# Show File names that changed 
echo -e "$BLUE>> Following files were changed in this pull request (commit range: $TRAVIS_COMMIT_RANGE):$NC" 
echo -e "$GREEN\n$CHANGED_FILES\n$NC" 

# Run  
echo -e "$BLUE>> Run grep ${CHANGED_FILES}:$NC" 
grep -rn ${CHANGED_FILES}
	