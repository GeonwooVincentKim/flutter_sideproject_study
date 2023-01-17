import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/model/radio_style.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';

class PageB extends StatefulWidget {
  final String pageId;
  const PageB({super.key, required this.pageId});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  List<RadioStyle> topButton = [];
  List<RadioStyle> bottomButton = [];
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
    bottomId = ModalRoute.of(context)!.settings.arguments as int;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
        backgroundColor: CupertinoColors.black
      ),
      body: Container(
        color: topButton[bottomId].color
      ),
    );
  }
}