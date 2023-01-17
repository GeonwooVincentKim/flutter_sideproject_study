import 'package:flutter/cupertino.dart';

class RadioStyle {
  final String contents;
  final Color color;

  RadioStyle({required this.contents, required this.color});

  factory RadioStyle.from(RadioStyle radioStyle) {
    return RadioStyle(
      contents: radioStyle.contents,
      color: radioStyle.color
    );
  }
}
