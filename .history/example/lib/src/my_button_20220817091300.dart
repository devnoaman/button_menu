import 'package:example/button_menu.dart';
import 'package:example/src/direction.dart';
import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    this.icon,
    this.onPressed,
    required this.items,
    this.direction = MenuDirection.bottom,
  }) : assert(items.length >= 3);

  final IconData? icon;
  final Function(bool)? onPressed;
  final List<ButtonItem> items;
  final MenuDirection? direction;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 56.0,
            constraints: BoxConstraints.loose(Size(56, 56)),
            // height: !pressed ?s 56.0 : 100.0,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(56.0),
              color: Colors.red,
            ),
            child: pressed
                ? Column(
                    children: [
                      const SizedBox(
                        height: 56.0,
                      ),
                      ...widget.items.map((e) => Icon(e.icon)).toList()
                    ],
                  )
                : SizedBox()),
        FloatingActionButton(
          onPressed: () {
            pressed = !pressed;
            widget.onPressed!(pressed);
            setState(() {});
          },
          child: Icon(widget.icon),
        ),
      ],
    );
  }
}
