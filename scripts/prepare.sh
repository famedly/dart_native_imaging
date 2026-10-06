#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later

mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ../ios/native_imaging/Sources/native_imaging/src
cmake --build .
