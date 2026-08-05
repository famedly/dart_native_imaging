// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:native_imaging/native_imaging.dart' as native;
import 'dart:typed_data';
import 'dart:io';

void main() async {
  await native.init();

  const width = 800;
  const height = 600;
  var nativeImg =
      native.Image.fromRGBA(width, height, Uint8List(width * height * 4));

  const max = 300;
  if (width > max || height > max) {
    var w = max, h = max;
    if (width > height) {
      h = max * height ~/ width;
    } else {
      w = max * width ~/ height;
    }

    final scaledImg = nativeImg.resample(w, h, native.Transform.lanczos);
    nativeImg.free();
    nativeImg = scaledImg;
  }

  final jpegBytes = await nativeImg.toJpeg(75);
  final blurhash = nativeImg.toBlurhash(3, 3);
  nativeImg.free();

  // ignore: avoid_print
  print('Blurhash: $blurhash');
  File('output.jpg').writeAsBytesSync(jpegBytes);
}
