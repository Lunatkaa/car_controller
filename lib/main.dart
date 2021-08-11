import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'controller.dart';
import 'device_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ControllerPage(),
    );
  }
}

class ControllerPage extends StatefulWidget {
  @override
  ControllerPageState createState() => ControllerPageState();
}

class ControllerPageState extends State<ControllerPage> {
  var _text = 'STOP';

  void _changeText(text) {
    setState(() {
      _text = text;
    });
  }

  void _onConnect() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DevicePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Controller(this._changeText, this._onConnect),
        ],
      ),
    );
  }
}
