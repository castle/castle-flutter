
import 'dart:async';

import 'package:flutter/services.dart';

class Castle {
  static const MethodChannel _channel =
      const MethodChannel('castle');

  static Future<void> configure({required publishableKey, debugLoggingEnabled, maxQueueLimit, flushLimit, baseURLAllowList, lifeCycleEventsEnabled}) async {
    await _channel.invokeMethod('configure', <String, dynamic>{
      'publishableKey': publishableKey,
      'debugLoggingEnabled': debugLoggingEnabled,
      'maxQueueLimit': maxQueueLimit,
      'flushLimit': flushLimit,
      'baseURLAllowList': baseURLAllowList,
      'lifeCycleEventsEnabled': lifeCycleEventsEnabled,
    });
  }

  static Future<void> userJwt(String userJwt) async {
    await _channel.invokeMethod('userJwt', <String, dynamic>{
      'userJwt': userJwt,
    });
  }

  static Future<void> screen(String name) async {
    await _channel.invokeMethod('screen', <String, dynamic>{
      'name': name,
    });
  }

  static Future<void> custom(String name, Map<String, dynamic>? properties) async {
    await _channel.invokeMethod('custom', <String, dynamic>{
      'name': name,
      'properties': properties,
    });
  }

  static Future<void> flush() async {
    await _channel.invokeMethod('flush');
  }

  static Future<bool?> flushIfNeeded(String url) async {
    final bool? flushIfNeeded = await _channel.invokeMethod('flushIfNeeded', <String, dynamic>{
      'url': url,
    });
    return flushIfNeeded;
  }

  static Future<void> reset() async {
    await _channel.invokeMethod('reset');
  }

  static Future<void> advertisingIdentifier(String identifier) async {
    await _channel.invokeMethod('advertisingIdentifier', <String, dynamic>{
      'identifier': identifier,
    });
  }

  static Future<String?> get createRequestToken async {
    final String? token = await _channel.invokeMethod('createRequestToken');
    return token;
  }

  static Future<String?> get requestTokenHeaderName async {
    final String? requestTokenHeaderName = await _channel.invokeMethod('requestTokenHeaderName');
    return requestTokenHeaderName;
  }

  static Future<String?> get userAgent async {
    final String? userAgent = await _channel.invokeMethod('userAgent');
    return userAgent;
  }

  static Future<int?> get queueSize async {
    final int? queueSize = await _channel.invokeMethod('queueSize');
    return queueSize;
  }
}
