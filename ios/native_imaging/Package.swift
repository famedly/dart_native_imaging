// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Only the libjpeg-turbo files needed for the library itself. The directory also
// contains command line tools (with their own main()), files that are meant to be
// #included by other sources and SIMD code, which must not be compiled.
let libjpegTurboSources = [
    "cdjpeg", "jaricom", "jcapimin", "jcapistd", "jcarith", "jccoefct", "jccolor",
    "jcdctmgr", "jchuff", "jcicc", "jcinit", "jcmainct", "jcmarker", "jcmaster",
    "jcomapi", "jcparam", "jcphuff", "jcprepct", "jcsample", "jctrans", "jdapimin",
    "jdapistd", "jdarith", "jdatadst", "jdatadst-tj", "jdatasrc", "jdatasrc-tj",
    "jdcoefct", "jdcolor", "jddctmgr", "jdhuff", "jdicc", "jdinput", "jdmainct",
    "jdmarker", "jdmaster", "jdmerge", "jdphuff", "jdpostct", "jdsample", "jdtrans",
    "jerror", "jfdctflt", "jfdctfst", "jfdctint", "jidctflt", "jidctfst", "jidctint",
    "jidctred", "jmemmgr", "jmemnobs", "jquant1", "jquant2", "jsimd_none", "jutils",
    "rdbmp", "rdcolmap", "rdppm", "rdswitch", "tjutil", "transupp", "turbojpeg",
    "wrbmp", "wrppm",
].map { "src/libjpeg-turbo/\($0).c" }

let imagingSources = [
    "Blend", "BoxBlur", "Copy", "Except", "extra", "Geometry", "Palette", "Resample",
    "Storage",
].map { "src/\($0).c" } + ["src/blurhash/encode.c"]

let package = Package(
    name: "native_imaging",
    platforms: [
        .iOS("15.0"),
    ],
    products: [
        // Dynamic, so the C functions are not dead stripped from the app binary.
        // Dart looks them up at runtime via DynamicLibrary.process().
        .library(name: "native-imaging", type: .dynamic, targets: ["native_imaging"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "native_imaging",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            sources: ["Classes/NativeImagingPlugin.m"] + imagingSources + libjpegTurboSources,
            resources: [],
            publicHeadersPath: "Classes",
            cSettings: [
                .headerSearchPath("src"),
                .headerSearchPath("src/ios"),
                .headerSearchPath("src/blurhash"),
                .headerSearchPath("src/libjpeg-turbo"),
                .define("JPEG_ENCODE"),
                .define("BMP_SUPPORTED"),
                .define("PPM_SUPPORTED"),
            ]
        )
    ]
)
