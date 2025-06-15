import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double navBarHeight;
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;

  NavButton({
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    required this.navBarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    const double _translationFactor =
        40.0 / 75.0; // keeps original proportion when nav bar height is 75

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Container(
            height: navBarHeight,
            child: Transform.translate(
              offset: Offset(
                  0,
                  difference < 1.0 / length
                      ? verticalAlignment * navBarHeight * _translationFactor
                      : 0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: child),
            )),
      ),
    );
  }
}
