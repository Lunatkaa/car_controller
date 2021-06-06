import 'package:flutter/material.dart';
import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _text = 'STOP';

  void _changeText(text) {
    setState(() {
      _text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BUMSCHAKALAKA',
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        appBar: AppBar(
          title: Text('Car Controller'),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              child: Text(
                _text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                ),
              ),
              alignment: Alignment.center,
            ),
            Controller(this._changeText),
          ],
        ),
      ),
    );
  }
}
// wie hoch ist die wahrscheinlichkeit dass der der das ließt Aaron heißt