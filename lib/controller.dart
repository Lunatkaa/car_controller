import 'package:flutter/material.dart';

import 'ControllerButton.dart';

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
