import 'package:flutter/material.dart';

class RecipePatternPainter extends CustomPainter {
  final Color color;
  final double opacity;

  RecipePatternPainter({
    this.color = Colors.white,
    this.opacity = 0.1,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(opacity)
      ..style = PaintingStyle.fill;

    // Draw cooking pot
    _drawPot(canvas, size, paint);
    
    // Draw utensils
    _drawUtensils(canvas, size, paint);
    
    // Draw food items
    _drawFoodItems(canvas, size, paint);
  }

  void _drawPot(Canvas canvas, Size size, Paint paint) {
    final path = Path();
    path.moveTo(size.width * 0.3, size.height * 0.3);
    path.lineTo(size.width * 0.7, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.2, size.height * 0.5);
    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawUtensils(Canvas canvas, Size size, Paint paint) {
    // Draw spoon
    final spoonPath = Path();
    spoonPath.moveTo(size.width * 0.2, size.height * 0.6);
    spoonPath.lineTo(size.width * 0.3, size.height * 0.6);
    spoonPath.lineTo(size.width * 0.25, size.height * 0.7);
    spoonPath.close();
    canvas.drawPath(spoonPath, paint);

    // Draw fork
    final forkPath = Path();
    forkPath.moveTo(size.width * 0.7, size.height * 0.6);
    forkPath.lineTo(size.width * 0.8, size.height * 0.6);
    forkPath.lineTo(size.width * 0.75, size.height * 0.7);
    forkPath.close();
    canvas.drawPath(forkPath, paint);
  }

  void _drawFoodItems(Canvas canvas, Size size, Paint paint) {
    // Draw carrot
    final carrotPath = Path();
    carrotPath.moveTo(size.width * 0.4, size.height * 0.4);
    carrotPath.lineTo(size.width * 0.5, size.height * 0.4);
    carrotPath.lineTo(size.width * 0.45, size.height * 0.5);
    carrotPath.close();
    canvas.drawPath(carrotPath, paint);

    // Draw tomato
    canvas.drawCircle(
      Offset(size.width * 0.6, size.height * 0.4),
      size.width * 0.05,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
} 