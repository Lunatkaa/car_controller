import 'package:flutter/material.dart';

import 'controller_button.dart';

class Controller extends StatelessWidget {
  final Function _changeText;
  final Function _onConnect;

  Controller(this._changeText, this._onConnect);

  void _handleButtons(message) {
    print(message);
    _changeText(message);
    // irgendeine bluetooth scheiße
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ControllerButton(
          child: Text(
            'FORWARD',
            style: TextStyle(color: Colors.white),
          ),
          onPointerDown: (e) => _handleButtons('FORWARD'),
          onPointerUp: (e) => _handleButtons('STOP'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              child: Text(
                'LEFT',
                style: TextStyle(color: Colors.white),
              ),
              onPointerDown: (e) => _handleButtons('LEFT'),
              onPointerUp: (e) => _handleButtons('STOP'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 110,
              width: 110,
              child: ElevatedButton(
                onPressed: _onConnect,
                child: Text('CONNECT'),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            ControllerButton(
              child: Text(
                'RIGHT',
                style: TextStyle(color: Colors.white),
              ),
              onPointerDown: (e) => _handleButtons('RIGHT'),
              onPointerUp: (e) => _handleButtons('STOP'),
            ),
          ],
        ),
        ControllerButton(
          child: Text(
            'BACK',
            style: TextStyle(color: Colors.white),
          ),
          onPointerDown: (e) => _handleButtons('BACK'),
          onPointerUp: (e) => _handleButtons('STOP'),
        ),
      ],
    );
  }
}
