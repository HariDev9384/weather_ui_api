import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class Location_Screen extends StatelessWidget {
   Future<weather_forcast>? forcast;
  var city;
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
                future: forcast,
                builder: (context,snapshot){
                  if(snapshot.hasData){
                    return Text(snapshot.data!.name!.toString());
                  }
                  else if(snapshot.hasError){
                    return Text('Api Loading Failed');
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              TextField(
                onSubmitted: (val){
                    city=val;
                },
              ),
              Center(
                child: RaisedButton(
                  child: Text('location fetch'),
                  onPressed: (){
                    fetch_api_notifier().get_weather();

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