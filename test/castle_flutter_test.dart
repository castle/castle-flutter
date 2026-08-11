import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castle_flutter/castle.dart';

void main() {
  const MethodChannel channel = MethodChannel('castle');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'createRequestToken':
          return "abc123";
        case 'requestTokenHeaderName':
          return 'X-Castle-Request-Token';
        default:
          return null;
      }
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('createRequestToken', () async {
    expect(await Castle.createRequestToken, 'abc123');
  });

  test('requestTokenHeaderName', () async {
    expect(await Castle.requestTokenHeaderName, 'X-Castle-Request-Token');
  });
}
