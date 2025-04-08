// Auto-generated file.

@JS('Imaging')
library js;

import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';

import 'package:js/js.dart';

@JS('init')
external dynamic _init();

Future<void> init() {
  return (_init() as JSPromise).toDart.then((_) {});
}

enum Transform {
  nearest,
  lanczos,
  bilinear,
  bicubic,
  box,
  hamming,
}

@JS()
class Image {
  external static Image fromRGBA(int width, int height, List<int> data);
  external static dynamic loadEncodedPromise(Uint8List bytes);
  static Future<Image> loadEncoded(Uint8List bytes) =>
      (loadEncodedPromise(bytes) as JSPromise)
          .toDart
          .then((value) => value as Image);
  external void free();
  external String get mode;
  external int get width;
  external int get height;
  external int get linesize;
  external Image copy();
  external Image blend(Image other, double alpha);
  external Image gaussianBlur(double radius, int passes);
  external Image rotate90();
  external Image rotate180();
  external Image rotate270();
  external Image flipLeftRight();
  external Image flipTopBottom();
  external Image transpose();
  external Image transverse();
  external Image resample(int width, int height, Transform mode);
  external String toBlurhash(int xComponents, int yComponents);
  external dynamic toJpegPromise(int quality);
}

extension ImageFutures on Image {
  Future<Uint8List> toJpeg(int quality) => (toJpegPromise(quality) as JSPromise)
      .toDart
      .then((value) => value as Uint8List);
}
