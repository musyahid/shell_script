#!/bin/bash

if [[ $1 = http?(s)://*.json ]]; then
    echo "invalid URL"
else
    curl $1 | jq '.'
fi



