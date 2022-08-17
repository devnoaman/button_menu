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
    this.iconSize = 45.0,
  }) : assert(items.length >= 3);

  final IconData? icon;
  final Function(bool)? onPressed;
  final List<ButtonItem> items;
  final MenuDirection? direction;
  final double iconSize;

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
            // constraints: BoxConstraints(minHeight: 56.0,maxHeight: 200),
            height: !pressed
                ? 56.0
                : widget.items.length * widget.iconSize!.toDouble(),
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              borderRadius: BorderRadius.circular(56.0),
              color: Colors.red,
            ),
            child: pressed
                ? FittedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 56.0,
                        ),
                        ...widget.items.map((e) => Icon(e.icon)).toList()
                      ],
                    ),
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
