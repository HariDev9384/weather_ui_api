import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/AppState.dart';
import 'package:weather_ui_api/widgets/Home_Widgets/AppBar.dart';
import 'package:weather_ui_api/widgets/Home_Widgets/Custom_Search.dart';
import 'package:weather_ui_api/widgets/Home_Widgets/Custom_Text.dart';
import 'package:weather_ui_api/widgets/Home_Widgets/custom_horizontal_containers.dart';
import 'package:weather_ui_api/widgets/Home_Widgets/custom_containers.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class Home extends StatelessWidget {
  var city;
  Future future=fetch_api_notifier().get_weather(AppState().search_txt);
  final GlobalKey _scaffoldkey=new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    final appstate=Provider.of<AppState>(context);
    final fetchstate=Provider.of<fetch_api_notifier>(context);
    return Consumer<fetch_api_notifier>(
    builder: ((context, value, child) => GestureDetector(
      child: Scaffold(
        key: _scaffoldkey,
          drawer:Drawer(
            
            child: SafeArea(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextField(
                        onChanged: (val){
                          city=val;
                          value.notifyListeners();
                           appstate.gettext(appstate.search_txt);
                          print(city);
                        },
                      ),
                      RaisedButton(
                        onPressed: (){
                          appstate.gettext(appstate.search_txt);
                          //fetch_api_notifier().get_weather();
                          value.notifyListeners();
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, 
                      icon: Icon(Icons.arrow_back))
                    ],
                  ),
                ],
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(255, 25, 2, 65),
          body: FutureBuilder<WeatherForecastModel>(
            future: fetch_api_notifier().get_weather(appstate.search_txt),
            builder: ((context,AsyncSnapshot<WeatherForecastModel> snapshot) {
              if(snapshot.hasData){
                return SafeArea(
              child: Stack(
                children: [
                  Positioned(
                  bottom: 0,
                  top:0,    
                    child: CustomAppBar(height: height,snapshot: snapshot,value: value,width: width,context: context,appstate:appstate).custom_appbar(height, width, snapshot, value, context, appstate),
                  ),
                  Positioned(
                    top:height/12.2,
                    left: height*0.05,
                    child: Container(
                    
                      height: 50,
                      width: width*0.8,
                      //color: Colors.red,
                      child: Custom_Search(height: height,width: width,context: context,value: value, snapshot: snapshot, appstate: appstate,fetchstate: fetchstate).custom_search(height,width,snapshot,value,context,appstate,fetchstate)),
                  ),
                  Positioned(
                    top: height/06,
                    bottom: height/1.9,
                    left: height/022,
                    child: CustomContainer(height: height,snapshot: snapshot,value: value,width: width).custom_container(height,width,snapshot,value)),
                  Positioned(
                      top: height*0.4,
                      child: hori_cont(height: height,width: width,context: context,snapshot: snapshot,value: value).custome_horizontal_7days(height, width, context,snapshot,value)),
                  Positioned(
                      top: height*0.45,
                      left: height*0.155,
                    child: Custom_Text(height:height,width:width,snapshot: snapshot,value: value).custom_text(height,snapshot,value)),
                    
                ],
              ),
            );
              }
              else if(snapshot.hasError){
                return Container(
                  color: Colors.white,
                  child: Center(child: Text('Network/Api Failed')),
                );
              }
              return Center(child: CircularProgressIndicator(color: Colors.white,));
            }),
             
          ),
        ),
    )
    ),
    );
  }

  

  
  


}