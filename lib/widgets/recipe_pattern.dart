import 'package:flutter/material.dart';
import 'recipe_pattern_painter.dart';

class RecipePattern extends StatelessWidget {
  final Color color;
  final double opacity;
  final Widget child;

  const RecipePattern({
    super.key,
    this.color = Colors.white,
    this.opacity = 0.1,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: RecipePatternPainter(
            color: color,
            opacity: opacity,
          ),
          child: Container(),
        ),
        child,
      ],
    );
  }
} 