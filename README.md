# native_imaging

Dart bindings for Imaging from Pillow with jpeg and blurhash encoders.

Imaging provides transformations like rotate, blend, blur, and resample with high-quality algorithms.
This package can be used to generate JPEG thumbnails and BlurHash strings.

## Usage
The Imaging library needs to be available.
- On Flutter for Android and iOS, the library is built automatically.
- On (Flutter) Web, build Imaging.js with `make -C js` or use the [build_js artifacts](https://gitlab.com/famedly/libraries/native_imaging/-/jobs/artifacts/master/download?job=build_js). Then embed it with a script tag: `<script src="js/Imaging.js"></script>`
- Otherwise, provide a build of the Imaging library from `ios/native_imaging/Sources/native_imaging/src`.
