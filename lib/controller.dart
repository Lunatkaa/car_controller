import 'package:flutter/material.dart';

import 'controller_button.dart';

class Controller extends StatelessWidget {
  final Function _changeText;

  Controller(this._changeText);

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
            // style: TextStyle(fontSize: 14),
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
                // style: TextStyle(fontSize: 14),
              ),
              onPointerDown: (e) => _handleButtons('LEFT'),
              onPointerUp: (e) => _handleButtons('STOP'),
            ),
            Container(
              margin: EdgeInsets.all(10),
              height: 110,
              width: 110,
            ),
            ControllerButton(
              child: Text(
                'RIGHT',
                style: TextStyle(color: Colors.white),
                // style: TextStyle(fontSize: 14),
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
            // style: TextStyle(fontSize: 14),
          ),
          onPointerDown: (e) => _handleButtons('BACK'),
          onPointerUp: (e) => _handleButtons('STOP'),
        ),
      ],
    );
  }
}
