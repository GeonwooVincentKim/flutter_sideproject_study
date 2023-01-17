import 'package:flutter/cupertino.dart';

class RadioStyle {
  final int value;
  late final String contents;
  final Color color;

  RadioStyle({required this.value, required this.contents, required this.color});

  factory RadioStyle.from(RadioStyle radioStyle) {
    return RadioStyle(
      value: radioStyle.value,
      contents: radioStyle.contents,
      color: radioStyle.color
    );
  }
}
