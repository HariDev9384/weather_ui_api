import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:http/http.dart'as http;

import '../models/weather.dart';

class fetch_api_notifier extends ChangeNotifier{
  var cityname;
  fetch_api_notifier([this.cityname]);
  String apikey='4b52ac77c2868edd488d6e344561ea9f';
  String city='coimbatore';
  // Fetch data from open weather api
  Future<weather_forcast> get_weather() async{
          var url='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey';
          final response=await http.get(Uri.parse(url));
          
          if(response.statusCode==200){
            print(cityname);
              var response_json=weather_forcast.fromJson(jsonDecode(response.body));
              print(response.body);
              return weather_forcast.fromJson(jsonDecode(response.body));
          }else{
            throw Exception('Json failed');
          }
          notifyListeners();
  }

}