import 'package:flutter/cupertino.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';

class AppState with ChangeNotifier{
  AppState();
  String search_text='coimbatore';
  String get search_txt=>search_text;
  gettext(String val){
    search_text=val;
    notifyListeners();
    fetch_api_notifier().get_weather(search_txt);
    notifyListeners();
  }
  // changeloc(String val){
  //   search_text=val;
  //   print('from change location method');
  //   notifyListeners();
  // }
  defaultloc(){
    print('default location $search_txt');
    fetch_api_notifier().get_weather(search_txt);
    notifyListeners();
  }
}