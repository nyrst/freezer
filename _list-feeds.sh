#!/bin/sh
ls *.yaml | xargs cat | grep "releases_feed" | sed -E 's/releases_feed: "(.*)"/\1/'