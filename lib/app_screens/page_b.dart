import 'package:flutter/cupertino.dart';

class PageB extends StatefulWidget {
  final String pageId;
  const PageB({super.key, required this.pageId});

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.pageId),
      ),
      child: Container()
    );
  }
}