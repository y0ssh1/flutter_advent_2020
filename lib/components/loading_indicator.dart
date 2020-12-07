import 'package:flutter/material.dart';

class LoadingIndicator extends CircularProgressIndicator {
  LoadingIndicator(Color color)
      : super(valueColor: AlwaysStoppedAnimation(color));
}
