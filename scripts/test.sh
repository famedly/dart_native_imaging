#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later

cd "$(dirname "$0")"/..
[ -d build ] && export LD_LIBRARY_PATH="$(pwd)/build" DYLD_LIBRARY_PATH="$(pwd)/build"
[ $# -eq 0 ] && set -- -p vm,chrome
dart test "$@"
