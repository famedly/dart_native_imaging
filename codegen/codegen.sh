#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# Regenerates lib/js.dart (web/Wasm via dart:js_interop) and lib/src/ffi.dart.
# Web bindings are defined in codegen/autojs.jq (Imaging.js API + interop wrappers).

cd "$(dirname "$0")"/..
codegen/autojs.jq < lib/native.dart > lib/js.dart
printf '#include "%s"\n' ios/src/extra.h | gcc -DJPEG_ENCODE -I ios/src -I ios/src/blurhash -I codegen -E - | codegen/autoffi.jq > lib/src/ffi.dart
