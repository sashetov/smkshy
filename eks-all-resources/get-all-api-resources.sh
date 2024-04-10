#!/bin/bash
for E in $(cat envs.conf.json| jq -r 'keys[]'); do
    echo "Getting all resources for env $E/";
    mkdir -p $E;
    ARN=$(cat envs.conf.json | jq -r ".$E")
    kubectl config use-context "$ARN"
    kubectl api-resources --verbs=list --namespaced -o name | while read O; do
        echo " Getting $E/$O.yaml";
        kubectl get $O  --all-namespaces -o yaml > $E/$O.yaml;
        echo " Done getting $E/$O.yaml";
    done;
    echo "Done getting all resources for $E";
done
