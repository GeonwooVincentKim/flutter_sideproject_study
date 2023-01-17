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
  String radioButtonItem = "ONE";

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
                _widgetSizedTextBox(context, true),
                Radio(
                  value: topRadio[0].value,
                  groupValue: topId,
                  onChanged: (value) {
                    setState(() {
                      topRadio[0].contents;
                      topRadio[0].color;
                      topId = topRadio[0].value;
                    });
                  },
                ),
                Text(
                  topRadio[0].contents,
                ),
                Radio(
                  value: topRadio[1].value,
                  groupValue: topId,
                  onChanged: (value) {
                    setState(() {
                      topRadio[1].contents;
                      topRadio[1].color;
                      topId = topRadio[1].value;
                    });
                  },
                ),
                Text(
                  topRadio[1].contents,
                )
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            Row(
              children: [
                _widgetSizedTextBox(context, false),
                Radio(
                  value: bottomRadio[0].value,
                  groupValue: bottomId,
                  onChanged: (value) {
                    setState(() {
                      bottomRadio[0].contents;
                      bottomRadio[0].color;
                      bottomId = bottomRadio[0].value;
                    });
                  },
                ),
                Text(
                  bottomRadio[0].contents,
                ),
                Radio(
                  value: topRadio[1].value,
                  groupValue: bottomId,
                  onChanged: (value) {
                    setState(() {
                      bottomRadio[1].contents;
                      bottomRadio[1].color;
                      bottomId = bottomRadio[1].value;
                    });
                  },
                ),
                Text(
                  bottomRadio[1].contents,
                )
              ],
            ),
          ],
        )
      ),
    ); 
  }

  SizedBox _widgetSizedTextBox(BuildContext context, isFirst) {
    return isFirst ? SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,  
      child: CustomCupertinoButton(getTitleText: getTitleText[1], routerName: "/pageA",)
    ) : SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[2], routerName: "/pageB",)
    );
  }
}
