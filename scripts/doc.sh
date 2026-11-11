#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later

cd "$(dirname "$0")"/..
# dartdoc needs FLUTTER_ROOT for packages with a `flutter:` section
: "${FLUTTER_ROOT:=$(dirname "$(dirname "$(readlink -f "$(command -v flutter)")")")}"
export FLUTTER_ROOT
dart doc "$@"
