#!/bin/bash
filename=$1
cat $filename | while read LINE; do
{
    IFS='/' read -ra SOURCE <<< $LINE
    file=${SOURCE[-1]}
    response=$(curl -s -w "\n%{http_code}" $LINE?format=json) exitCode=$?
    echo $'\n'
    echo $LINE | cat -v
    array=(${response[@]}) # array
        body=${array[@]::${#array[@]}-1}
        echo $body | jq .
        echo $body | jq . > result/${file}.json
        echo "${file}.json created"
};
done <"$filename"