// Copyright (c) 2020 Famedly GmbH
// SPDX-License-Identifier: AGPL-3.0-or-later

import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:native_imaging/native_imaging.dart' as native;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await native.init();
  runApp(const MaterialApp(home: DemoPage()));
}

class DemoResult {
  const DemoResult({
    required this.source,
    required this.thumbnail,
    required this.blurred,
    required this.rotated,
    required this.blurhash,
    required this.elapsed,
  });

  final Uint8List source;
  final Uint8List thumbnail;
  final Uint8List blurred;
  final Uint8List rotated;
  final String blurhash;
  final Duration elapsed;
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  final _random = Random();
  late Future<DemoResult> _result = _run();

  void _shuffle() => setState(() {
    _result = _run();
  });

  Future<DemoResult> _run() async {
    // 1. Draw a random 1200x800 picture and read it back as raw RGBA.
    const width = 1200, height = 800;
    final picture = await _drawPicture(width, height);
    final rgba = (await picture.toByteData(
      format: ui.ImageByteFormat.rawRgba,
    ))!.buffer.asUint8List();
    final png = (await picture.toByteData(
      format: ui.ImageByteFormat.png,
    ))!.buffer.asUint8List();
    picture.dispose();

    // 2. Process it with native_imaging.
    final stopwatch = Stopwatch()..start();
    final full = native.Image.fromRGBA(width, height, rgba);
    final thumb = full.resample(300, 200, native.Transform.lanczos);
    full.free();

    final blurred = thumb.gaussianBlur(8, 3);
    final rotated = thumb.rotate90();

    final result = DemoResult(
      source: png,
      thumbnail: await thumb.toJpeg(75),
      blurred: await blurred.toJpeg(75),
      rotated: await rotated.toJpeg(75),
      blurhash: thumb.toBlurhash(4, 3),
      elapsed: stopwatch.elapsed,
    );

    thumb.free();
    blurred.free();
    rotated.free();
    return result;
  }

  Future<ui.Image> _drawPicture(int width, int height) {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final rect = Rect.fromLTWH(0, 0, width.toDouble(), height.toDouble());
    Color randomColor() => Color.fromARGB(
      255,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );

    canvas.drawRect(
      rect,
      Paint()
        ..shader = ui.Gradient.linear(rect.topLeft, rect.bottomRight, [
          randomColor(),
          randomColor(),
        ]),
    );
    for (var i = 0; i < 12; i++) {
      canvas.drawCircle(
        Offset(_random.nextDouble() * width, _random.nextDouble() * height),
        40 + _random.nextDouble() * 160,
        Paint()..color = randomColor().withValues(alpha: 0.8),
      );
    }
    return recorder.endRecording().toImage(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('native_imaging')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _shuffle,
        icon: const Icon(Icons.shuffle),
        label: const Text('New image'),
      ),
      body: FutureBuilder<DemoResult>(
        future: _result,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final result = snapshot.data;
          if (result == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 96),
            children: [
              _Section('Source (1200×800, drawn with dart:ui)', result.source),
              _Section(
                'Thumbnail (Lanczos 300×200, JPEG q75, '
                '${result.thumbnail.lengthInBytes} bytes)',
                result.thumbnail,
              ),
              _Section('Gaussian blur (radius 8, 3 passes)', result.blurred),
              _Section('Rotated 90°', result.rotated),
              const SizedBox(height: 8),
              Text('Blurhash', style: Theme.of(context).textTheme.titleSmall),
              SelectableText(
                result.blurhash,
                style: const TextStyle(fontFamily: 'monospace'),
              ),
              const SizedBox(height: 16),
              Text(
                'Native processing took '
                '${result.elapsed.inMicroseconds / 1000} ms',
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section(this.title, this.bytes);

  final String title;
  final Uint8List bytes;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(height: 4),
          Image.memory(bytes, gaplessPlayback: true),
        ],
      ),
    );
  }
}
