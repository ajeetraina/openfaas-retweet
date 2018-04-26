#!/bin/bash

# Setting up Visualizer
docker-compose up -d
git clone https://github.com/openfaas/faas
cd faas

./deploy_stack.sh
curl -sSL https://cli.openfaas.com | sudo sh
mkdir -p ~/retweet && \
cd retweet
faas-cli new --lang python retweet
faas-cli build  -f ./retweet.yml
