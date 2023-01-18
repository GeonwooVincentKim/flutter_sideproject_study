import 'package:flutter/cupertino.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/shared/style.dart';

class CustomCupertinoButton extends StatelessWidget {
  final String getTitleText;
  final String routerName;
  final int getCurrentStyle;
  final bool isCurrentPage;

  const CustomCupertinoButton({super.key, required this.getTitleText, required this.routerName, required this.getCurrentStyle, required this.isCurrentPage});

  @override
  Widget build(BuildContext context) {
    print("Get Value -> $getCurrentStyle");

    return isCurrentPage == false ? CupertinoButton(
      color: blue,
      padding: paddingSymmetricSmall,
      onPressed: () async => Navigator.of(context).pushNamed(routerName, arguments: getCurrentStyle),
      child: Text(getTitleText),
    ) : CupertinoButton(
      color: grey,
      padding: paddingSymmetricSmall,
      onPressed: () {},
      child: Text(getTitleText),
    );
  }
}
