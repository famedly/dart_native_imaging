# 2.0.0

- build(android): migrate to AGP 9.1 and Gradle 9.3.1 (yurtemre7)
- **Breaking:** Android apps must use AGP 9+ with built-in Kotlin enabled (`android.builtInKotlin=true`, the AGP 9 default) (yurtemre7)
- chore: align CODEOWNERS with current team structure (Niklas Zender)
- ci: pin Flutter 3.47.9 and load versions.env in app and publish jobs (yurtemre7)
- feat: add example app (yurtemre7)
- fix: replace removed pub/dartdoc commands in scripts (yurtemre7)
- fix: skip ELF-only linker flag on Apple and require CMake 3.22 (yurtemre7)
- style: reformat with the new Dart formatter (yurtemre7)

# 1.0.0

- feat: add SPM support
- build: set minimum iOS version to 15.0

# 0.5.0

- feat: migrate web bindings to dart:js_interop for Wasm compatibility

# 0.4.0

- fix: add HEAPF32 export (td)
- fix: add HEAPU8 export (td)

# 0.3.0

- build: Changelog for 0.2.0 (Krille)
- fix: support 16kb page alignment (td)

# 0.2.0

- refactor: Remove deprecated flutter v1 android reference (Krille)

# 0.1.2

- chore: Add codeowners (Krille)
- chore: upgrade gradle to 8.4.1 (Mohammad Reza Moradi)

# 0.1.1

- refactor: Switch to flutter_lints and use import sorter
- builds: Update API constraints to fix a lint
- builds: Use ci templates

# 0.1.0

- Initial release
