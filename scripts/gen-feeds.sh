#!/bin/sh
# Generate the committed feeds.conf for zhou1407/lede-H69k:
#   upstream feeds.conf.default (kept identical to coolsnowwolf/lede)
#   + fork-specific feeds from feeds.custom
#
# feeds.conf is committed because scripts/feeds prefers it over
# feeds.conf.default, so OpenWrt-CI (which still uses upstream's workflow file)
# builds the fork's feed set. After editing feeds.custom run:
#   ./scripts/gen-feeds.sh && git add -f feeds.conf && git commit
# For a local build:  ./scripts/gen-feeds.sh  (then make menuconfig)
set -eu
cd "$(dirname "$0")/.."

# This fork historically built without the helloworld feed: keep it disabled.
sed 's|^src-git helloworld |#src-git helloworld |' feeds.conf.default > feeds.conf
cat feeds.custom >> feeds.conf
echo "Generated $PWD/feeds.conf"
