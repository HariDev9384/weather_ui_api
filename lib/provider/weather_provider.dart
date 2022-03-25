import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart'as http;
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/AppState.dart';

class fetch_api_notifier with ChangeNotifier{
  //primary api key
  String apikey='ed60fcfbd110ee65c7150605ea8aceea';
  //seconary key
  //String apikey='187f23446c6a5876ab8e9a3bee6023db';
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
  }
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
    get_weather(AppState().search_txt);
  }

}