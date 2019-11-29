#!/bin/bash
docker run --rm -ti \
 -e-file <(env | grep -iE 'DEBUG|NODE_|ELECTRON_|YARN_|NPM_|CI|CIRCLE|TRAVIS_TAG|TRAVIS|TRAVIS_REPO_|TRAVIS_BUILD_|TRAVIS_BRANCH|TRAVIS_PULL_REQUEST_|APPVEYOR_|CSC_|GH_|GITHUB_|BT_|AWS_|STRIP|BUILD_') \
 -e ELECTRON_CACHE="/root/.cache/electron" \
 -e ELECTRON_BUILDER_CACHE="/root/.cache/electron-builder" \
 -e GH_TOKEN="${GH_TOKEN}" \
 -v ${PWD}:/project \
 -v ${PWD##*/}-node-modules:/project/node_modules \
 -v ~/.cache/electron:/root/.cache/electron \
 -v ~/.cache/electron-builder:/root/.cache/electron-builder \
 electronuserland/builder:wine /bin/bash -c "yarn && yarn electron:build -w -p always"