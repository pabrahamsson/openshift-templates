#!/bin/bash

YQ_VER="2.4.1"
export PATH=$PATH:$HOME/bin
mkdir -p $HOME/bin
curl -Lo $HOME/bin/yq https://github.com/mikefarah/yq/releases/download/${YQ_VER}/yq_linux_amd64
chmod +x $HOME/bin/yq

# Check we only have 1 extension for yml
find .. -type f -name "*.yaml" -exec echo {} \;
if [[ $(find .. -type f -name "*.yaml" | wc -l)  -gt 0 ]] ; then echo "Found .yaml; only expected .yml"; exit 1; fi
# Validate yml
find .. -type f -name "*.yml" -exec echo -e "\n{}" \; -exec  yq read {} \;
