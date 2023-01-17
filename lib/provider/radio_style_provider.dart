import 'package:flutter/cupertino.dart';
import 'package:yein_design_app/data/radio_data.dart';
import 'package:yein_design_app/model/radio_style.dart';

class RadioStyleProvider with ChangeNotifier {
  final List<RadioStyle> _radioStyle = DUMMY_STYLE.toList();
  List<RadioStyle> get radioStyle => [..._radioStyle];
}
