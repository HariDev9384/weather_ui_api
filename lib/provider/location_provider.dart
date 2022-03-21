import 'package:flutter/widgets.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class location_provider extends ChangeNotifier{
  String? location;
  location_provider([this.location]);
  get_location(){
    fetch_api_notifier(location);
    notifyListeners();
  }
}