#!/bin/bash

set -e

pod lib lint SemiliquidGlass.podspec
pod trunk push SemiliquidGlass.podspec
