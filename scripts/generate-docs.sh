#!/bin/bash

set -e

# This should fix the unstable DocC export.
export DOCC_JSON_PRETTYPRINT="YES"

swift package \
    --allow-writing-to-directory ./docs \
    generate-documentation --target SemiliquidGlass \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path SemiliquidGlass/ \
    --output-path ./docs
