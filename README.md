# Castle for Flutter

**[Castle](https://castle.io) adds real-time monitoring of your authentication stack, instantly notifying you and your users on potential account hijacks.**

[![Pub Version](https://img.shields.io/pub/v/flutter_castle)](https://pub.dev/packages/flutter_castle)
[![CircleCI](https://img.shields.io/circleci/build/github/castle/castle-flutter/master?token=1ac87baf6b68cf1b425e8156ffc0c7497432026f)](https://circleci.com/gh/castle/castle-flutter)
[![codecov](https://codecov.io/gh/castle/castle-flutter/branch/master/graph/badge.svg?token=aH0nyqcUoV)](https://codecov.io/gh/castle/castle-flutter)

## Usage
To use this plugin, add `flutter_castle` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

## Requirements

### Flutter
 - Flutter 1.20.0+

### iOS
 - iOS 9.0+
 - Xcode 9.0+

### Android
 - Android 5.0

## Usage

```dart
import 'package:castle_flutter/castle.dart';

// Set properties
await Castle.identify('thisisatestuser');
await Castle.secure('944d7d6c5187cafac297785bbf6de0136a2e10f31788e92b2822f5cfd407fa52');

// Fetch properties
var clientId = await Castle.clientId;
var clientIdHeaderName = await Castle.clientIdHeaderName;
var userId = await Castle.userId;
var queueSize = await Castle.queueSize;
var userSignature = await Castle.userSignature;
var userAgent = await Castle.userAgent;

// Configure with custom configuration properties
var configuration = Configuration("pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ",
    true,
    100,
    20,
    false);

await Castle.configure(configuration);

// Configure using default configuration properties
await Castle.configureWithPublishableKey('pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ');

```

## License

MIT
