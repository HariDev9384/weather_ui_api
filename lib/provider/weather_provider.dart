import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/AppState.dart';

class fetch_api_notifier with ChangeNotifier{
  String apikey='4b52ac77c2868edd488d6e344561ea9f';
  String? cityname;
  fetch_api_notifier();
  String? get city=>cityname;
  // Fetch data from open weather api
  Future<WeatherForecastModel> get_weather(city) async{
          var url='https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apikey';
          final response=await http.get(Uri.parse(url));
          
          if(response.statusCode==200){
            print(cityname);
              var response_json=WeatherForecastModel.fromJson(jsonDecode(response.body));
              print(response.body);
              notifyListeners();
              return WeatherForecastModel.fromJson(jsonDecode(response.body));
          }else{
            throw Exception('Json failed');
          }
          notifyListeners();
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
    get_weather(AppState().search_txt);
  }

}