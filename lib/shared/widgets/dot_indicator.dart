import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator(
      {super.key, required this.dotCount, required this.selectedIndex});

  final int dotCount, selectedIndex;
  final Color activeColor = Colors.orangeAccent, inactiveColor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(dotCount, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 12.0,
          height: 12.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == selectedIndex ? activeColor : inactiveColor,
          ),
        );
      }),
    );
  }
}
