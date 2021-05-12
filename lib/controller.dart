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
          onPressed: () => _changeText('FORWARD'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ControllerButton(
              child: Text(
                'LEFT',
                // style: TextStyle(fontSize: 14),
              ),
              onPressed: () => _changeText('LEFT'),
            ),
            ControllerButton(
              child: Text(
                'STOP',
                // style: TextStyle(fontSize: 14),
              ),
              onPressed: () => _changeText('STOP'),
            ),
            ControllerButton(
              child: Text(
                'RIGHT',
                // style: TextStyle(fontSize: 14),
              ),
              onPressed: () => _changeText('RIGHT'),
            ),
          ],
        ),
        ControllerButton(
          child: Text(
            'BACK',
            // style: TextStyle(fontSize: 14),
          ),
          onPressed: () => _changeText('BACK'),
        ),
      ],
    );
  }
}
