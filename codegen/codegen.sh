#!/bin/sh -e
# Copyright (c) 2020 Famedly GmbH
# SPDX-License-Identifier: AGPL-3.0-or-later
#
# Regenerates lib/js.dart (web/Wasm via dart:js_interop) and lib/src/ffi.dart.
# Web bindings are defined in codegen/autojs.jq (Imaging.js API + interop wrappers).

cd "$(dirname "$0")"/..
SRC=ios/native_imaging/Sources/native_imaging/src

codegen/autojs.jq < lib/native.dart > lib/js.dart
printf '#include "%s"\n' "$SRC"/extra.h | gcc -DJPEG_ENCODE -I "$SRC" -I "$SRC"/blurhash -I codegen -E - | codegen/autoffi.jq > lib/src/ffi.dart
