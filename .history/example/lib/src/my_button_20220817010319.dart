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
    return Stack(
      children: [
        Container(
          width: 56.0,
          height: 56.0,
          color: Colors.red,
        ),
        FloatingActionButton(
          onPressed: () {
            widget.onPressed!(pressed);
          },
          child: Icon(widget.icon),
        ),
      ],
    );
  }
}
