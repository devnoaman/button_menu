import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final IconData? icon;
  final Function(bool)? onPressed;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        widget.onPressed!(pressed);
      },
      child: Icon(widget.icon),
    );
  }
}
