import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castle_flutter/castle.dart';

void main() {
  const MethodChannel channel = MethodChannel('castle');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'baseUrl':
          return 'https://api.castle.io';
        case 'clientId':
          return '1bdcfd7a-401b-4ccf-88fe-884ad298ff2c';
        case 'clientIdHeaderName':
          return 'X-Castle-Client-Id';
        case 'clientIdHeaderName':
          return 'X-Castle-Request-Token';
        case 'userId':
          return 'thisisatestuser1';
        case 'userSignature':
          return '944d7d6c5187cafac297785bbf6de0136a2e10f31788e92b2822f5cfd407fa52';
        case 'userAgent':
          return 'castle_flutter_example/1.0 (1)(Castle 1.2.2; Android 11; Google sdk_gphone_x86_arm)';
        case 'queueSize':
          return 100;
        default:
          return null;
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('baseUrl', () async {
    expect(await Castle.baseUrl, 'https://api.castle.io');
  });

  test('clientId', () async {
    expect(await Castle.clientId, '1bdcfd7a-401b-4ccf-88fe-884ad298ff2c');
  });


  test('requestTokenHeaderName', () async {
    expect(await Castle.requestTokenHeaderName, 'X-Castle-Request-Token');
  });

  test('clientIdHeaderName', () async {
    expect(await Castle.clientIdHeaderName, 'X-Castle-Client-Id');
  });

  test('userId', () async {
    expect(await Castle.userId, 'thisisatestuser1');
  });

  test('userSignature', () async {
    expect(await Castle.userSignature, '944d7d6c5187cafac297785bbf6de0136a2e10f31788e92b2822f5cfd407fa52');
  });

  test('userAgent', () async {
    expect(await Castle.userAgent, 'castle_flutter_example/1.0 (1)(Castle 1.2.2; Android 11; Google sdk_gphone_x86_arm)');
  });

  test('queueSize', () async {
    expect(await Castle.queueSize, 100);
  });
}
