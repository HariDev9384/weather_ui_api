import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/location_provider.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class Location_Screen extends StatelessWidget{
  var city;
  getcity(value){
    city=value;
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<fetch_api_notifier>(
      builder: ((context,value,child)=>
       Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 20,),
              FutureBuilder<weather_forcast>(
                
                future: fetch_api_notifier().get_weather(),
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data!.name.toString());
                  }
                  else if(snapshot.hasError){
                    return Text('Api Loading Failed');
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              TextField(
                //controller: TextEditingController.fromValue(TextEditingValue value),
                onSubmitted: (val){
                  getcity(val);
                  location_provider(val);
                  print(city);
                  value.notifyListeners();
                },
              ),
              Center(
                child: RaisedButton(
                  child: Text('location fetch'),
                  onPressed: (){
                      location_provider(city).get_location();
                      value.notifyListeners();
                  }
                ),
              ),
            ],
          ),
        ),
        
      )
      )
    );
  }
}