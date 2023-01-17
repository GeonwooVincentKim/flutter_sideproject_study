import 'package:cupertino_text_button/cupertino_text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String getTitleText;
  final String routerName;

  const CustomTextButton({super.key, required this.getTitleText, required this.routerName});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        elevation: 1,
        backgroundColor: Colors.blue,
      ),
      child: Text(
        getTitleText,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      onPressed: () async {
        Navigator.of(context).pushNamed(routerName);
      },
    );
  }
}