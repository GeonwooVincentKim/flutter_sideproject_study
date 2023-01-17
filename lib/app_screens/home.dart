import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';
import 'package:yein_design_app/shared/style.dart';
import 'package:yein_design_app/widgets/cupertino_button.dart';
import 'package:yein_design_app/widgets/text_button.dart';

class Home extends StatefulWidget {
  final String pageId;
  const Home({super.key, required this.pageId});

  @override
  State<Home> createState() => _HomeState();
}

enum ColorValues {R, G}

class _HomeState extends State<Home> {
  List<String> valueTitle = ['Red', 'Green'];
  List<RadioStyle> radioStyleList = List.empty(growable: true); 

  @override
  void initState() {
    setState(() {
      radioStyleList = Provider.of<RadioStyleProvider>(context, listen: false).radioStyle;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
        backgroundColor: CupertinoColors.black,
      ),
      child: Container(
        padding: paddingSymmetricBig,
        child: Column(
          children: [
            _widgetSizedTextBox(context),
            
            // Row(
            //   children: [
                
            //   ],
            // )
          ],
        )
      ),
    ); 
  }

  SizedBox _widgetSizedTextBox(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / textButtonWidth,
      height: MediaQuery.of(context).size.height / textButtonHeight,
      child: CustomCupertinoButton(getTitleText: getTitleText[1], routerName: "/pageA",)
      // child: CustomTextButton(getTitleText: getTitleText[1], routerName: "/pageA",)
    );
  }
}
