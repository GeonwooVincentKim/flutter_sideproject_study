import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';
import 'package:yein_design_app/shared/style.dart';
import 'package:yein_design_app/widgets/cupertino_button.dart';

class Home extends StatefulWidget {
  final String pageId;
  const Home({super.key, required this.pageId});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<RadioStyle> topRadio = [];
  List<RadioStyle> bottomRadio = [];

  int topId = 1;
  int bottomId = 1;

  @override
  void initState() {
    setState(() {
      topRadio = Provider.of<RadioStyleProvider>(context, listen: false).radioStyle;
      bottomRadio = Provider.of<RadioStyleProvider>(context, listen: false).radioStyle;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navigationBar: CupertinoNavigationBar(
      //   middle: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
      //   backgroundColor: CupertinoColors.black,
      // ),
      appBar: AppBar(
        backgroundColor: CupertinoColors.black,
        title: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)), 
      ),
      body: Container(
        padding: paddingSymmetricBig,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _widgetSizedTextBox(context, true, topId),
                _widgetCustomRadioTop(0),
                Text(topRadio[0].contents),
                
                _widgetCustomRadioTop(1),
                Text(topRadio[1].contents)
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Row(
              children: [
                _widgetSizedTextBox(context, false, bottomId),
                _widgetCustomRadioBottom(0),
                Text(bottomRadio[0].contents),
                
                _widgetCustomRadioBottom(1),
                Text(bottomRadio[1].contents)
              ],
            ),
          ],
        )
      ),
    ); 
  }

  Radio<int> _widgetCustomRadioBottom(index) {
    return Radio(
      value: bottomRadio[index].value,
      groupValue: bottomId,
      onChanged: (value) {
        setState(() {
          bottomRadio[index].contents;
          bottomRadio[index].color;
          bottomId = bottomRadio[index].value;
        });
      },
    );
  }

  Radio<int> _widgetCustomRadioTop(index) {
    return Radio(
      value: topRadio[index].value,
      groupValue: topId,
      onChanged: (value) {
        setState(() {
          topRadio[index].contents;
          topRadio[index].color;
          topId = topRadio[index].value;
        });
      },
    );
  }

  SizedBox _widgetSizedTextBox(BuildContext context, isTop, radioId) {
    return isTop ? SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[1], routerName: "/pageA", getCurrentStyle: radioId, isCurrentPage: false)
    ) : SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[2], routerName: "/pageB", getCurrentStyle: radioId, isCurrentPage: false)
    );
  }
}
