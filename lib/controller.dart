import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

import 'ControllerButton.dart';

class Controller extends StatelessWidget {
  final Function _changeText;
  final BluetoothConnection _connection;

  Controller(this._changeText, this._connection);

  void _handleButtons(message) {
    _connection.output.add(utf8.encode(message));
    _changeText(message);
    // irgendeine bluetooth scheiße
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ControllerButton(
          text: 'FORWARD',
          onPointerDown: (e) => _handleButtons('FORWARD'),
          onPointerUp: (e) => _handleButtons('STOP'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              text: 'LEFT',
              onPointerDown: (e) => _handleButtons('LEFT'),
              onPointerUp: (e) => _handleButtons('STOP'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 110,
              width: 110,
            ),
            ControllerButton(
              text: 'RIGHT',
              onPointerDown: (e) => _handleButtons('RIGHT'),
              onPointerUp: (e) => _handleButtons('STOP'),
            ),
          ],
        ),
        ControllerButton(
          text: 'BACK',
          onPointerDown: (e) => _handleButtons('BACK'),
          onPointerUp: (e) => _handleButtons('STOP'),
        ),
      ],
    );
  }
}
