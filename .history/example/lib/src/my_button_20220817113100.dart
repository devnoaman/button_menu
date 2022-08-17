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
    this.animatedIcon,
    this.verticalSpacing = 8,
  }) : assert(items.length >= 3);

  final IconData? icon;
  final Function(bool)? onPressed;
  final List<ButtonItem> items;
  final MenuDirection? direction;
  final double iconSize;
  final double verticalSpacing;
  final AnimatedIconData? animatedIcon;

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
              : widget.items.length * widget.iconSize.toDouble() +
                  widget.verticalSpacing,
          decoration: BoxDecoration(
            // shape: BoxShape.circle,
            borderRadius: BorderRadius.circular(56.0),
            color: Colors.red,
          ),
          child: pressed
              ? FittedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 56.0,
                      ),
                      SizedBox(
                        height: widget.verticalSpacing / 2,
                      ),
                      ...widget.items
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(e.icon),
                              ))
                          .toList(),
                      SizedBox(
                        height: widget.verticalSpacing / 2,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ),
        FloatingActionButton(
          onPressed: () {
            pressed = !pressed;
            widget.onPressed!(pressed);
            setState(() {});
          },
          child: IconButton(
            icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                      turns: child.key == ValueKey('icon1')
                          ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                          : Tween<double>(begin: 0.75, end: 1).animate(anim),
                      child: FadeTransition(opacity: anim, child: child),
                    ),
                child: pressed
                    ? Icon(Icons.close, key: const ValueKey('icon1'))
                    : Icon(
                        Icons.arrow_back,
                        key: const ValueKey('icon2'),
                      )),
            onPressed: () {
              setState(() {
                // _currIndex = _currIndex == 0 ? 1 : 0;
              });
            },
          ),

          // Icon(widget.icon),
        ),
      ],
    );
  }
}
