import 'package:flutter/material.dart';

class GradationIcon extends StatelessWidget {
  final IconData icon;
  final double size;

  const GradationIcon({Key key, @required this.icon, @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xffE885C3), Color(0xff80CAEA)],
          stops: [0, 1.0]).createShader(rect),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}
