import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';
import 'package:yein_design_app/shared/style.dart';
import 'package:yein_design_app/widgets/cupertino_button.dart';

class PageA extends StatefulWidget {
  final String pageId;
  const PageA({super.key, required this.pageId});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  List<RadioStyle> topButton = [];
  List<RadioStyle> bottomButton = [];
  
  late int? topId;
  int bottomId = 0;
  // late int? bottomId;

  @override
  void initState() {
    setState(() {
      topButton = Provider.of<RadioStyleProvider>(context, listen: false).radioStyle;
      bottomButton = Provider.of<RadioStyleProvider>(context, listen: false).radioStyle;
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    topId = ModalRoute.of(context)!.settings.arguments as int;
    // bottomId = ModalRoute.of(context)!.settings.arguments as int;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
        backgroundColor: CupertinoColors.black,
      ),
      body: Container(
        padding: paddingSymmetricBig,
        color: topButton[topId!].color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _widgetSizedTextBox(context, true, topId),
                _widgetCustomRadioDefault(0),
                Text(topButton[0].contents),
                
                _widgetCustomRadioDefault(1),
                Text(topButton[1].contents)
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Row(
              children: [
                _widgetSizedTextBox(context, false, bottomId),
                _widgetCustomRadioBottom(0),
                Text(bottomButton[0].contents,),
                
                _widgetCustomRadioBottom(1),
                Text(bottomButton[1].contents,)
              ],
            ),
          ],
        )
      ),
    );
  }

  Radio<int> _widgetCustomRadioDefault(index) {
    return Radio(
      value: topButton[index].value,
      groupValue: topId,
      onChanged: (value) {},
    );
  }

  Radio<int> _widgetCustomRadioBottom(index) {
    return Radio(
      value: bottomButton[index].value,
      groupValue: bottomId,
      onChanged: (value) {
        setState(() {
          bottomId = value!;
          // bottomButton[index].contents;
          // bottomButton[index].color;
          // bottomId = bottomButton[index].value;
        });
      },
    );
  }

  SizedBox _widgetSizedTextBox(BuildContext context, isTop, radioId) {
    return isTop ? SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[1], routerName: "/pageA", getCurrentStyle: radioId, isCurrentPage: true)
    ) : SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[2], routerName: "/pageB", getCurrentStyle: radioId, isCurrentPage: false)
    );
  }
}