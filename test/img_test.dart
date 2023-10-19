// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'package:native_imaging/native_imaging.dart';
import 'package:test/test.dart';
import 'dart:typed_data';

void main() async {
  await init();

  test('thumbnail and blurhash', () async {
    final im = Image.loadRGBA(800, 600, Uint8List(800 * 600 * 4));
    final im2 = im.resample(80, 60, Transform.lanczos);
    final blob = await im2.toJpeg(70);
    final blurhash = im2.toBlurhash(4, 3);
    im.free();
    im2.free();

    expect(blob[0], 0xff);
    expect(blob[1], 0xd8);
    expect(blurhash, 'L00000fQfQfQfQfQfQfQfQfQfQfQ');
  });

  test('get metadata', () async {
    final im = Image.loadRGBA(200, 100, Uint8List(200 * 100 * 4));
    expect(im.mode, 'RGBA');
    expect(im.width, 200);
    expect(im.height, 100);
    expect(im.linesize, 200 * 4);
  });

  test('gaussian blur', () async {
    final im = Image.loadRGBA(800, 600, Uint8List(800 * 600 * 4));
    final im2 = im.gaussianBlur(10, 2);
    im.free();
    im2.free();
  });
}
