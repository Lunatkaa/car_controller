import 'package:flutter/material.dart';

import 'Controller.dart';

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
                fontWeight: FontWeight.w500,
              ),
            ),
            alignment: Alignment.center,
          ),
          Controller(this._changeText),
        ],
      ),
    );
  }
}
