#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e306d3b46035f0014565f4b/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e306d3b46035f0014565f4b
curl -s -X POST https://api.stackbit.com/project/5e306d3b46035f0014565f4b/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5e306d3b46035f0014565f4b/webhook/build/publish > /dev/null
