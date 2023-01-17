import 'package:flutter/cupertino.dart';
import 'package:yein_design_app/shared/style.dart';

class CustomCupertinoButton extends StatelessWidget {
  final String getTitleText;
  final String routerName;

  const CustomCupertinoButton({super.key, required this.getTitleText, required this.routerName});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: blue,
      padding: paddingSymmetricSmall,
      onPressed: () async => Navigator.of(context).pushNamed(routerName),
      child: Text(getTitleText),
    );
  }
}
