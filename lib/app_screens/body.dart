import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yein_design_app/app_screens/home.dart';
import 'package:yein_design_app/app_screens/page_a.dart';
import 'package:yein_design_app/app_screens/page_b.dart';
import 'package:yein_design_app/shared/style.dart';

class Body extends StatelessWidget {
  final int index;

  const Body({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return Home(pageId: getTitleText[0]);
    } if (index == 1) {
      return PageA(pageId: getTitleText[1]);
    } if (index == 2) {
      return PageB(pageId: getTitleText[2]);
    } else {
      return Home(pageId: getTitleText[0]);
    }
  }
}
