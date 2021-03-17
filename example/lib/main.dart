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
  String _clientId = '';
  String _userId = '';
  String _baseUrl = '';
  int _queueSize = 0;
  String _userAgent = '';
  String _clientIdHeaderName = '';

  @override
  void initState() {
    super.initState();
    initCastle();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCastle() async {
    var clientId, userId, baseUrl, queueSize, userAgent, clientIdHeaderName;
    try {
      await Castle.configure(
        publishableKey: "pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ",
        debugLoggingEnabled: true,
        maxQueueLimit: 100,
        flushLimit: 20,
        useCloudflareApp: false,
        baseURLAllowList: ["http://google.com"],
      );
      clientId = await Castle.clientId;
      userId = await Castle.userId;
      baseUrl = await Castle.baseUrl;
      queueSize = await Castle.queueSize;
      userAgent = await Castle.userAgent;
      clientIdHeaderName = await Castle.clientIdHeaderName;
    } on PlatformException {

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _clientId = clientId.toString();
      _userId = userId.toString();
      _baseUrl = baseUrl.toString();
      _queueSize = queueSize;
      _userAgent = userAgent.toString();
      _clientIdHeaderName = clientIdHeaderName.toString();
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
                _clientId
              ),
              Text(
                _userId
              ),
              Text(
                _baseUrl
              ),
              Text(
                _queueSize.toString()
              ),
              Text(
                _userAgent
              ),
              Text(
                _clientIdHeaderName
              ),
              new ElevatedButton(
                  onPressed: _identify,
                  child: new Text("Identify")
              ),
              new ElevatedButton(
                  onPressed: _trackScreen,
                  child: new Text("Track Screen")
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

  void _identify() {
    Castle.identify("thisisatestuser1");
  }

  void _trackScreen() {
    Castle.screen("Example screen");
  }

  void _reset() {
    Castle.reset();
  }

  void _flush() {
    Castle.flush();
  }
}
