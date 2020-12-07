import 'package:flutter/material.dart';

class DashDivider extends StatelessWidget {
  final Color color;
  final double height;

  const DashDivider({
    Key key,
    this.color = Colors.black38,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashPainter(color, height),
    );
  }
}

class _DashPainter extends CustomPainter {
  final Color color;
  final double height;

  _DashPainter(this.color, this.height);

  @override
  void paint(Canvas canvas, Size size) {
    var startX = 0.0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = height;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + 3, 0), paint);
      startX += 3 + 2;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
