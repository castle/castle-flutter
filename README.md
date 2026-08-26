# Castle for Flutter

**[Castle](https://castle.io) adds real-time monitoring to your authentication stack, instantly notifying you and your users of potential account hijacks.**

[![Pub Version](https://img.shields.io/pub/v/castle_flutter)](https://pub.dev/packages/castle_flutter)
[![CircleCI](https://img.shields.io/circleci/build/github/castle/castle-flutter/master?token=1ac87baf6b68cf1b425e8156ffc0c7497432026f)](https://circleci.com/gh/castle/castle-flutter)

**NOTE:** Version `4.0.0` has breaking changes compared to previous `2.x.x` versions. There is no `3.x` release; the version was bumped to `4.0.0` to match the major version of the native SDKs. iOS integration is now Swift Package Manager only and CocoaPods is no longer supported. The minimum Android API level is 26 and the minimum iOS version is 13.0. `flushIfNeeded`, `userAgent` and `queueSize` have been removed. See [Upgrading from 2.x to 4.0.0](#upgrading-from-2x-to-400).

## Installation
To use this plugin, add `castle_flutter` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

This plugin requires **Swift Package Manager**. CocoaPods is not supported, because the Castle
iOS SDK is not published to CocoaPods from version 4.0.0 onwards. SPM is enabled by default from
Flutter 3.44; on earlier versions enable it before running `flutter pub get`:

```sh
flutter config --enable-swift-package-manager
```

Note that `flutter pub get` fails for every platform, not just iOS, while SPM is disabled.

## Requirements

### Flutter
 - Flutter 3.29.0+ (3.44+ recommended)
 - Dart 3.4.0+

### iOS
 - iOS 13.0+
 - Swift Package Manager

### Android
 - Android 8.0 (API 26)

## Upgrading from 2.x to 4.0.0

There is no 3.x release. The version number was moved straight to 4.0.0 so that it matches the
major version of the native SDKs the plugin wraps.

Version 4.0.0 updates to Castle Android SDK 4.x and Castle iOS SDK 4.x, which contain breaking
changes of their own. See the [CHANGELOG](CHANGELOG.md), and the
[Android](https://docs.castle.io/docs/android-sdk-migrating-from-v3-to-v4) and
[iOS](https://docs.castle.io/docs/ios-sdk-migrating-from-v3-to-v4) migration guides.

## Usage

Please see the [Mobile Integration Guide](https://docs.castle.io).

## License

MIT
