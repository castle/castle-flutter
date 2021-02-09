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

  @override
  void initState() {
    super.initState();
    initCastle();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initCastle() async {
    try {
      //await Castle.configureWithPublishableKey("pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ");
      await Castle.configure(Configuration("pk_SE5aTeotKZpDEn8kurzBYquRZyy21fvZ",
          true,
          100,
          20,
          false));
    } on PlatformException {

    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
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
              new RaisedButton(
                  onPressed: _identify,
                  child: new Text("Identify")
              ),
              new RaisedButton(
                  onPressed: _trackScreen,
                  child: new Text("Track Screen")
              ),
              new RaisedButton(
                  onPressed: _reset,
                  child: new Text("Reset")
              ),
              new RaisedButton(
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
