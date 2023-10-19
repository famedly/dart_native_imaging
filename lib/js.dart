// Auto-generated file.

@JS('Imaging')
library js;

import 'package:js/js.dart';
import 'dart:async';
import 'dart:js_util';
import 'dart:typed_data';

@JS('init')
external dynamic _init();

Future<void> init() {
  return promiseToFuture(_init());
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
  external Image loadRGBA(int width, int height, List<int> data);
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
  external dynamic loadEncodedPromise(Uint8List bytes);
  external dynamic toJpegPromise(int quality);
}

extension ImageFutures on Image {
  Future<Image> loadEncoded(Uint8List bytes) {
    return promiseToFuture(loadEncodedPromise(bytes));
  }

  Future<Uint8List> toJpeg(int quality) {
    return promiseToFuture(toJpegPromise(quality));
  }
}
