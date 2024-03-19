import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:castle_flutter/castle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _token = '';
  int _queueSize = 0;
  String _userAgent = '';
  String _requestTokenHeaderName = '';

  @override
  void initState() {
    super.initState();
    initCastle();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCastle() async {
    var token, userId, baseUrl, queueSize, userAgent, clientIdHeaderName, requestTokenHeaderName;
    try {
      await Castle.configure(
        publishableKey: "pk_CTsfAeRTqxGgA7HHxqpEESvjfPp4QAKA",
        debugLoggingEnabled: true,
        maxQueueLimit: 100,
        flushLimit: 20,
        baseURLAllowList: ["http://google.com"],
      );
      // Set mock IDFA
      await Castle.advertisingIdentifier("00000000-0000-0000-0000-000000000001");
      token = await Castle.createRequestToken;
      queueSize = await Castle.queueSize;
      userAgent = await Castle.userAgent;
      requestTokenHeaderName = await Castle.requestTokenHeaderName;
      await Castle.userJwt(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjMjQ0ZjMwLTM0MzItNGJiYy04OGYxLTFlM2ZjMDFiYzFmZSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsInJlZ2lzdGVyZWRfYXQiOiIyMDIyLTAxLTAxVDA5OjA2OjE0LjgwM1oifQ.eAwehcXZDBBrJClaE0bkO9XAr4U3vqKUpyZ-d3SxnH0"
      );
    } on PlatformException {

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _token = token.toString();
      _queueSize = queueSize;
      _userAgent = userAgent.toString();
      _requestTokenHeaderName = requestTokenHeaderName.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Castle TestApp'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                _token
              ),
              Text(
                _queueSize.toString()
              ),
              Text(
                _userAgent
              ),
              Text(
                  _requestTokenHeaderName
              ),
              new ElevatedButton(
                  onPressed: _userJwt,
                  child: new Text("Set user jwt")
              ),
              new ElevatedButton(
                  onPressed: _trackScreen,
                  child: new Text("Track Screen")
              ),
              new ElevatedButton(
                  onPressed: _trackCustom,
                  child: new Text("Track custom")
              ),
              new ElevatedButton(
                  onPressed: _trackCustomProperties,
                  child: new Text("Track custom with properties")
              ),
              new ElevatedButton(
                  onPressed: _reset,
                  child: new Text("Reset")
              ),
              new ElevatedButton(
                  onPressed: _flush,
                  child: new Text("Flush Events")
              ),
            ],
          ),
        )
      ),
    );
  }

  void _userJwt() {
    Castle.userJwt(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImVjMjQ0ZjMwLTM0MzItNGJiYy04OGYxLTFlM2ZjMDFiYzFmZSIsImVtYWlsIjoidGVzdEBleGFtcGxlLmNvbSIsInJlZ2lzdGVyZWRfYXQiOiIyMDIyLTAxLTAxVDA5OjA2OjE0LjgwM1oifQ.eAwehcXZDBBrJClaE0bkO9XAr4U3vqKUpyZ-d3SxnH0"
    );
  }

  void _trackScreen() {
    Castle.screen("Example screen");
  }

  void _trackCustom() {
    Castle.custom("Custom event", null);
  }

  void _trackCustomProperties() {
    Castle.custom("Custom event with properties", {
      "product": "iPhone 13 Pro",
      "price": 1099.99
    });
  }

  void _reset() {
    Castle.reset();
  }

  void _flush() {
    Castle.flush();
  }
}
