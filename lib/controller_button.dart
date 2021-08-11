import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final Widget child;
  final Function onPointerDown;
  final Function onPointerUp;

  ControllerButton({
    @required this.child,
    @required this.onPointerDown,
    @required this.onPointerUp,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: this.onPointerDown,
      onPointerUp: this.onPointerUp,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
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
