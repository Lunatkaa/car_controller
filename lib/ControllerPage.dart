import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'Controller.dart';

class ControllerPage extends StatefulWidget {
  final BluetoothConnection _connection;

  ControllerPage(this._connection);

  @override
  ControllerPageState createState() => ControllerPageState(_connection);
}

class ControllerPageState extends State<ControllerPage> {
  final BluetoothConnection _connection;

  ControllerPageState(this._connection);

  var _text = 'STOP';

  void _changeText(text) {
    setState(() {
      _text = text;
    });
  }

  @override
  void dispose() {
    super.dispose();

    _connection.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Controller'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 250,
            child: Text(
              _text,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
            alignment: Alignment.center,
          ),
          Controller(_changeText, _connection),
        ],
      ),
    );
  }
}
