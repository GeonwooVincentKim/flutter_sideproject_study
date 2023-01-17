import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yein_design_app/app_screens/body.dart';
import 'package:yein_design_app/app_screens/page_a.dart';
import 'package:yein_design_app/app_screens/page_b.dart';
import 'package:yein_design_app/provider/radio_style_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => RadioStyleProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.light),
        // theme: const CupertinoThemeData(brightness: Brightness.light),
        initialRoute: "/",
        routes: {
          "/": (context) => const Body(index: 0),
          "/pageA": (context) => const PageA(pageId: '', color: Colors.black),
          // "/pageB": (context) => const PageB(pageId: ''),
        },
        onGenerateRoute: (settings) {
          final List<String> pathElements = settings.name!.split("/");

          if (pathElements[0] != '') return null;
          if (pathElements[1] == 'pageA') {
            String pageA = pathElements[2];
            return MaterialPageRoute(builder: (context) => PageA(pageId: pageA, color: Colors.black,), settings: settings);
            // return CupertinoPageRoute(builder: (context) => PageA(pageId: pageA), settings: settings);
          }

          // if (pathElements[2] == 'pageB') {
          //   String pageB = pathElements[2];
          //   return MaterialPageRoute(builder: (context) => PageB(pageId: pageB), settings: settings);
          //   // return CupertinoPageRoute(builder: (context) => PageB(pageId: pageB), settings: settings);
          // }
        },
      )
    );
  }
}
