import 'package:flutter/material.dart';

import 'controller_button.dart';

class Controller extends StatelessWidget {
  final Function _changeText;

  Controller(this._changeText);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ControllerButton(
          child: Text(
            'FORWARD',
            // style: TextStyle(fontSize: 14),
          ),
          onTapDown: (e) => _changeText('FORWARD'),
          onTapUp: (e) => _changeText('STOP'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              child: Text(
                'LEFT',
                // style: TextStyle(fontSize: 14),
              ),
              onTapDown: (e) => _changeText('LEFT'),
              onTapUp: (e) => _changeText('STOP'),
            ),
            Container(
              height: 110,
              width: 110,
            ),
            ControllerButton(
              child: Text(
                'RIGHT',
                // style: TextStyle(fontSize: 14),
              ),
              onTapDown: (e) => _changeText('RIGHT'),
              onTapUp: (e) => _changeText('STOP'),
            ),
          ],
        ),
        ControllerButton(
          child: Text(
            'BACK',
            // style: TextStyle(fontSize: 14),
          ),
          onTapDown: (e) => _changeText('BACK'),
          onTapUp: (e) => _changeText('STOP'),
        ),
      ],
    );
  }
}
