// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:ffi';
import 'dart:io';

final libImaging = Platform.isIOS
    ? DynamicLibrary.process()
    : DynamicLibrary.open(
        Platform.isAndroid
            ? 'libImaging.so'
            : Platform.isWindows
            ? 'libImaging.dll'
            : Platform.isMacOS
            ? 'libImaging.dylib'
            : 'libImaging.so',
      );
