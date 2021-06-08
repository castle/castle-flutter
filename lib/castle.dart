
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class Castle {
  static const MethodChannel _channel =
      const MethodChannel('castle');

  static Future<void> configure({@required publishableKey, debugLoggingEnabled, maxQueueLimit, flushLimit, useCloudflareApp, baseURLAllowList}) async {
    await _channel.invokeMethod('configure', <String, dynamic>{
      'publishableKey': publishableKey,
      'debugLoggingEnabled': debugLoggingEnabled,
      'maxQueueLimit': maxQueueLimit,
      'flushLimit': flushLimit,
      'useCloudflareApp': useCloudflareApp,
      'baseURLAllowList': baseURLAllowList,
    });
  }

  static Future<void> identify(String userId) async {
    await _channel.invokeMethod('identify', <String, dynamic>{
      'userId': userId,
    });
  }

  static Future<void> secure(String signature) async {
    await _channel.invokeMethod('secure', <String, dynamic>{
      'signature': signature,
    });
  }

  static Future<void> screen(String name) async {
    await _channel.invokeMethod('screen', <String, dynamic>{
      'name': name,
    });
  }

  static Future<void> flush() async {
    await _channel.invokeMethod('flush');
  }

  static Future<bool> flushIfNeeded(String url) async {
    final bool flushIfNeeded = await _channel.invokeMethod('flushIfNeeded', <String, dynamic>{
      'url': url,
    });
    return flushIfNeeded;
  }

  static Future<void> reset() async {
    await _channel.invokeMethod('reset');
  }

  static Future<String> get baseUrl async {
    final String baseUrl = await _channel.invokeMethod('baseUrl');
    return baseUrl;
  }

  static Future<String> get clientId async {
    final String clientId = await _channel.invokeMethod('clientId');
    return clientId;
  }

  static Future<String> get clientIdHeaderName async {
    final String clientIdHeaderName = await _channel.invokeMethod('clientIdHeaderName');
    return clientIdHeaderName;
  }

  static Future<String> get createRequestToken async {
    final String token = await _channel.invokeMethod('createRequestToken');
    return token;
  }

  static Future<String> get requestTokenHeaderName async {
    final String requestTokenHeaderName = await _channel.invokeMethod('requestTokenHeaderName');
    return requestTokenHeaderName;
  }

  static Future<String> get userId async {
    final String userId = await _channel.invokeMethod('userId');
    return userId;
  }

  static Future<String> get userSignature async {
    final String userSignature = await _channel.invokeMethod('userSignature');
    return userSignature;
  }

  static Future<String> get userAgent async {
    final String userAgent = await _channel.invokeMethod('userAgent');
    return userAgent;
  }

  static Future<int> get queueSize async {
    final int queueSize = await _channel.invokeMethod('queueSize');
    return queueSize;
  }
}
