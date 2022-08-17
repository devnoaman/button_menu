import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    Key? key,
    this.icon,
  }) : super(key: key);

  final IconData? icon;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Icon(widget.icon),
    );
  }
}
