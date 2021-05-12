import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  ControllerButton({
    @required this.child,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 110,
      width: 110,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: this.child,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
    );
  }
}
