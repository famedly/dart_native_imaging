// Auto-generated file.
// ignore_for_file: non_constant_identifier_names

import 'ffi_base.dart';
import 'dart:ffi';
import 'package:ffi/ffi.dart';

final ImagingNew = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
    Pointer<NativeType> Function(
        Pointer<Utf8> mode, int xsize, int ysize)>('ImagingNew');

final ImagingNewDirty = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
    Pointer<NativeType> Function(
        Pointer<Utf8> mode, int xsize, int ysize)>('ImagingNewDirty');

final ImagingNew2Dirty = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<NativeType> imOut,
        Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<Utf8> mode, Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingNew2Dirty');

final ImagingDeleteAddress =
    libImaging.lookup<NativeFunction<Void Function(Pointer<NativeType>)>>(
        'ImagingDelete');
final ImagingDelete =
    ImagingDeleteAddress.asFunction<void Function(Pointer<NativeType>)>();

final ImagingNewBlock = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
    Pointer<NativeType> Function(
        Pointer<Utf8> mode, int xsize, int ysize)>('ImagingNewBlock');

final ImagingNewPrologue = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode, Int32 xsize, Int32 ysize),
    Pointer<NativeType> Function(
        Pointer<Utf8> mode, int xsize, int ysize)>('ImagingNewPrologue');

final ImagingNewPrologueSubtype = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<Utf8> mode, Int32 xsize, Int32 ysize, Int32 structure_size),
    Pointer<NativeType> Function(Pointer<Utf8> mode, int xsize, int ysize,
        int structure_size)>('ImagingNewPrologueSubtype');

final ImagingCopyPalette = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> destination, Pointer<NativeType> source),
    void Function(Pointer<NativeType> destination,
        Pointer<NativeType> source)>('ImagingCopyPalette');

final ImagingPaletteNew = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<Utf8> mode),
    Pointer<NativeType> Function(Pointer<Utf8> mode)>('ImagingPaletteNew');

final ImagingPaletteNewBrowser = libImaging.lookupFunction<
    Pointer<NativeType> Function(),
    Pointer<NativeType> Function()>('ImagingPaletteNewBrowser');

final ImagingPaletteDuplicate = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<NativeType> palette),
    Pointer<NativeType> Function(
        Pointer<NativeType> palette)>('ImagingPaletteDuplicate');

final ImagingPaletteDelete = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> palette),
    void Function(Pointer<NativeType> palette)>('ImagingPaletteDelete');

final ImagingPaletteCachePrepare = libImaging.lookupFunction<
    Int32 Function(Pointer<NativeType> palette),
    int Function(Pointer<NativeType> palette)>('ImagingPaletteCachePrepare');

final ImagingPaletteCacheUpdate = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> palette, Int32 r, Int32 g, Int32 b),
    void Function(Pointer<NativeType> palette, int r, int g,
        int b)>('ImagingPaletteCacheUpdate');

final ImagingPaletteCacheDelete = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> palette),
    void Function(Pointer<NativeType> palette)>('ImagingPaletteCacheDelete');

final ImagingSectionEnter = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> cookie),
    void Function(Pointer<NativeType> cookie)>('ImagingSectionEnter');

final ImagingSectionLeave = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> cookie),
    void Function(Pointer<NativeType> cookie)>('ImagingSectionLeave');

final ImagingBlend = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imIn1, Pointer<NativeType> imIn2, Float alpha),
    Pointer<NativeType> Function(Pointer<NativeType> imIn1,
        Pointer<NativeType> imIn2, double alpha)>('ImagingBlend');

final ImagingCopy = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<NativeType> im),
    Pointer<NativeType> Function(Pointer<NativeType> im)>('ImagingCopy');

final ImagingFlipLeftRight = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingFlipLeftRight');

final ImagingFlipTopBottom = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingFlipTopBottom');

final ImagingGaussianBlur = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn, Float radius, Int32 passes),
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut,
        Pointer<NativeType> imIn,
        double radius,
        int passes)>('ImagingGaussianBlur');

final ImagingRotate90 = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingRotate90');

final ImagingRotate180 = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingRotate180');

final ImagingRotate270 = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingRotate270');

final ImagingTranspose = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingTranspose');

final ImagingTransverse = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn)>('ImagingTransverse');

final ImagingResample = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<NativeType> imIn, Int32 xsize,
        Int32 ysize, Int32 filter, Pointer<Float> box),
    Pointer<NativeType> Function(Pointer<NativeType> imIn, int xsize, int ysize,
        int filter, Pointer<Float> box)>('ImagingResample');

final ImagingTransform = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut,
        Pointer<NativeType> imIn,
        Int32 method,
        Int32 x0,
        Int32 y0,
        Int32 x1,
        Int32 y1,
        Pointer<Double> a,
        Int32 filter,
        Int32 fill),
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut,
        Pointer<NativeType> imIn,
        int method,
        int x0,
        int y0,
        int x1,
        int y1,
        Pointer<Double> a,
        int filter,
        int fill)>('ImagingTransform');

final ImagingBoxBlur = libImaging.lookupFunction<
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn, Float radius, Int32 n),
    Pointer<NativeType> Function(Pointer<NativeType> imOut,
        Pointer<NativeType> imIn, double radius, int n)>('ImagingBoxBlur');

final ImagingCopy2 = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn),
    Pointer<NativeType> Function(
        Pointer<NativeType> imOut, Pointer<NativeType> imIn)>('ImagingCopy2');

final imageFromRGBA = libImaging.lookupFunction<
    Pointer<NativeType> Function(
        Int32 width, Int32 height, Pointer<Uint8> data),
    Pointer<NativeType> Function(
        int width, int height, Pointer<Uint8> data)>('imageFromRGBA');

final imageMode = libImaging.lookupFunction<
    Pointer<Utf8> Function(Pointer<NativeType> im),
    Pointer<Utf8> Function(Pointer<NativeType> im)>('imageMode');

final imageWidth = libImaging.lookupFunction<
    Int32 Function(Pointer<NativeType> im),
    int Function(Pointer<NativeType> im)>('imageWidth');

final imageHeight = libImaging.lookupFunction<
    Int32 Function(Pointer<NativeType> im),
    int Function(Pointer<NativeType> im)>('imageHeight');

final imageLinesize = libImaging.lookupFunction<
    Int32 Function(Pointer<NativeType> im),
    int Function(Pointer<NativeType> im)>('imageLinesize');

final imageBlock = libImaging.lookupFunction<
    Pointer<Uint8> Function(Pointer<NativeType> im),
    Pointer<Uint8> Function(Pointer<NativeType> im)>('imageBlock');

final blurHashForImage = libImaging.lookupFunction<
    Pointer<Utf8> Function(
        Pointer<NativeType> im, Int32 xComponents, Int32 yComponents),
    Pointer<Utf8> Function(Pointer<NativeType> im, int xComponents,
        int yComponents)>('blurHashForImage');

final jpegEncode = libImaging.lookupFunction<
    Void Function(Pointer<NativeType> im, Int32 quality,
        Pointer<Pointer<Uint8>> data, Pointer<IntPtr> size),
    void Function(Pointer<NativeType> im, int quality,
        Pointer<Pointer<Uint8>> data, Pointer<IntPtr> size)>('jpegEncode');
