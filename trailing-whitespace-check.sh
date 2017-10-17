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

echo -e "TRAVIS_COMMIT_RANGE = $TRAVIS_COMMIT_RANGE"

# Round up all changed content 
CHANGED_FILES=($(git diff --name-only $TRAVIS_COMMIT_RANGE)) 

# Show File names that changed 
echo -e "$BLUE>> Following files were changed in this pull request (commit range: ${TRAVIS_COMMIT_RANGE}):$NC" 
echo -e "$GREEN $CHANGED_FILES $NC" 

# Run  
echo -e "$BLUE>> Run grep -rln --exclude=\*.{qm,fcstd,png,po,ts} --exclude-dir={3rdParty,zipios++,CXX,.git,} $'\t' ${CHANGED_FILES}:$NC" 
grep -rln --exclude=\*.{qm,fcstd,png,po,ts} --exclude-dir={3rdParty,zipios++,CXX,.git,} $'\t'${CHANGED_FILES}
	
 
exit 1;