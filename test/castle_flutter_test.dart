import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castle_flutter/castle.dart';

void main() {
  const MethodChannel channel = MethodChannel('castle');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'createRequestToken':
          return "abc123";
        case 'requestTokenHeaderName':
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

  test('createRequestToken', () async {
    expect(await Castle.createRequestToken, 'abc123');
  });

  test('requestTokenHeaderName', () async {
    expect(await Castle.requestTokenHeaderName, 'X-Castle-Request-Token');
  });

  test('userAgent', () async {
    expect(await Castle.userAgent, 'castle_flutter_example/1.0 (1)(Castle 1.2.2; Android 11; Google sdk_gphone_x86_arm)');
  });

  test('queueSize', () async {
    expect(await Castle.queueSize, 100);
  });
}
