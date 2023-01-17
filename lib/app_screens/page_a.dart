import 'package:flutter/cupertino.dart';

class PageA extends StatefulWidget {
  final String pageId;
  const PageA({super.key, required this.pageId});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.pageId, textAlign: TextAlign.center, style: const TextStyle(color: CupertinoColors.white, fontSize: 25)),
        backgroundColor: CupertinoColors.black
      ),
      child: Container(
        child: Center(
          child: const Text("Testing"),
        )
      ),
    );
  }
}