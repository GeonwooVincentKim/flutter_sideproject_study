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
  
  late int topId;
  late int bottomId;

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
    // topButton = ModalRoute.of(context)!.settings.arguments as List<RadioStyle>;
    // _checkTopRadio = ModalRoute.of(context)!.settings.arguments as RadioStyle;
    topId = ModalRoute.of(context)!.settings.arguments as int;
    bottomId = ModalRoute.of(context)!.settings.arguments as int;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // final getRadioStyle = ModalRoute.of(context)!.settings.arguments as PageA;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
        backgroundColor: CupertinoColors.black
      ),
      body: Container(
        color: topButton[topId].color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                _widgetSizedTextBox(context, true, topId),
                // _widgetCustomRadioTop(0),
                Radio(
                  value: topButton[0].value,
                  groupValue: topId,
                  onChanged: (value) {},
                ),
                Text(topButton[0].contents),
                
                // _widgetCustomRadioTop(1),
                Radio(
                  value: topButton[1].value,
                  groupValue: topId,
                  onChanged: (value) {},
                ),
                Text(topButton[1].contents)
              ],
            ),
            // const Padding(padding: EdgeInsets.symmetric(vertical: 30)),
            // Row(
            //   children: [
            //     _widgetSizedTextBox(context, true, bottomId),
            //     _widgetCustomRadioBottom(0),
            //     Text(bottomRadio[0].contents,),
                
            //     _widgetCustomRadioBottom(1),
            //     Text(bottomRadio[1].contents,)
            //   ],
            // ),
          ],
        )
      ),
    );
  }
  // Radio<int> _widgetCustomRadioBottom(index) {
  //   return Radio(
  //     value: bottomRadio[index].value,
  //     groupValue: bottomId,
  //     onChanged: (value) {
  //       setState(() {
  //         bottomRadio[index].contents;
  //         bottomRadio[index].color;
  //         bottomId = bottomRadio[index].value;
  //       });
  //     },
  //   );
  // }

  // Radio<int> _widgetCustomRadioTop(index) {
  //   return Radio(
  //     value: topRadio[index].value,
  //     groupValue: topId,
  //     onChanged: (value) {
  //       setState(() {
  //         topRadio[index].contents;
  //         topRadio[index].color;
  //         topId = topRadio[index].value;
  //       });
  //     },
  //   );
  // }

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