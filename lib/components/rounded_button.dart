import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;
  final Widget child;

  const RoundedButton({
    Key key,
    @required this.onTap,
    @required this.width,
    @required this.height,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(height / 2),
          side: BorderSide(color: Colors.black26)),
      onPressed: onTap,
      child: SizedBox(
        height: height,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
