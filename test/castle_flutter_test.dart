import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castle_flutter/castle.dart';

void main() {
  const MethodChannel channel = MethodChannel('castle');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '100';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getQueueSize', () async {
    expect(await Castle.queueSize, '100');
  });
}
