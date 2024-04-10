#!/bin/bash
set -x
cd $HOME/src/eks-all-resources || exit 1
./k8s-get-api-resouces || exit 1
git add . || exit 1
COMMIT_TIME=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "Update: $COMMIT_TIME" || exit 1
#git push || exit 1
set +x
exit 0
