import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final Widget child;
  final Function onTapDown;
  final Function onTapUp;

  ControllerButton({
    @required this.child,
    @required this.onTapDown,
    @required this.onTapUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: this.onTapDown,
      onTapUp: this.onTapUp,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(12),
        height: 110,
        width: 110,
        child: this.child,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
      ),
    );
  }
}
