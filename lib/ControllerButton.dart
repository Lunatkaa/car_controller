import 'package:flutter/material.dart';

class ControllerButton extends StatelessWidget {
  final String text;
  final Function onPointerDown;
  final Function onPointerUp;

  ControllerButton({
    @required this.text,
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
        child: Text(
          this.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
        ),
      ),
    );
  }
}
