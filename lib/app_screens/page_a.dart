import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';

class PageA extends StatefulWidget {
  final String pageId;
  final Color color;
  const PageA({super.key, required this.pageId, required this.color});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  List<RadioStyle> topButton = [];
  List<RadioStyle> bottomButton = [];
  late int topId;

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
        color: topButton[topId].color
      ),
    );
  }
}