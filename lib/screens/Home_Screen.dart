import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/AppState.dart';
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
                    child: custom_appbar(height,width,snapshot,value,context,appstate)),
                  Positioned(
                    top:height/12.2,
                    left: height*0.05,
                    child: Container(
                    
                      height: 50,
                      width: width*0.8,
                      //color: Colors.red,
                      child: custom_search(height,width,snapshot,value,context,appstate,fetchstate)),
                  ),
                  Positioned(
                    top: height/06,
                    bottom: height/1.8,
                    left: height/022,
                    child: custom_container(height,width,snapshot,value)),
                  Positioned(
                      top: height*0.4,
                      child: custome_horizontal_7days(height, width, context,snapshot,value)),
                  Positioned(
                      top: height*0.45,
                      left: height*0.155,
                    child: custom_text(height,snapshot,value)),
                    
                ],
              ),
            );
              }
              else if(snapshot.hasError){
                return Container(
                  color: Colors.white,
                  child: Text('Network Failed'),
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
  Widget custom_search(height,width,snapshot,value,context,appstate,fetchstate){
    return TextField(
      onSubmitted: (val){
        appstate.gettext(val);
      },
      decoration: InputDecoration(
      
        hintText: 'Enter your location',
        hintStyle: TextStyle(
          color: Colors.white
        ),
        prefixIcon: IconButton(
          icon: Icon(Icons.search,color: Colors.white),
          onPressed: (){
            print('search area');
          },
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white,),
          borderRadius: BorderRadius.circular(10)
        )
      ),
    );

  }
  Widget custom_text(var height,snapshot,value){
    return Container(
      
      child: Text('Next 7 Days',
      style: TextStyle(
        fontSize: height*0.03,
        fontWeight: FontWeight.bold,
        color: Colors.white,
        wordSpacing: 3.0
      ),
      ),
    );
  }

  Widget custom_appbar(var height,var width,snapshot,value,context,appstate){
    return Container(
      height: height*1,
      width: width/1,
      color: Color.fromARGB(255, 25, 2, 65),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
              icon: Icon(Icons.menu,color: Colors.white),
              onPressed: (){
                 Scaffold.of(context).openDrawer();
              },
                  ),
                  SizedBox(width: width/7),
                  Text('Weather Forcast',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height*0.025
                  ),
                  ),

            ],
          )
        ],
      ),
    );
  }

  Widget custom_container(var height,var width,snapshot,value){
    return Container(
          padding: EdgeInsets.all(15),
          height: height*0.2,
          width: width*0.80,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                
                Text('Today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.02,
                  fontWeight: FontWeight.bold
                ),
                ),
                Text('Sat,19 Mar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height*0.02,
                  fontWeight: FontWeight.bold
                ),
                )
                ],),
                SizedBox(height: height*0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data.city.name,
                    style: TextStyle(
                      fontSize: height*0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    ),Text('oC',
                    style: TextStyle(
                      fontSize: height*0.03,
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow
                    ),
                    )
                  ],
                ),
                SizedBox(height: height*0.02),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on_outlined),
                      color: Colors.yellow,
                      onPressed: ()=>print('location change'),
                    ),
                    Text('',
                    style: TextStyle(
                      fontSize: height*0.02,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                    )
                  ],
                )
            ],
          ),
          decoration: BoxDecoration(
          color: Color.fromARGB(15, 59, 58, 58).withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)
          
          ),
        );
  }

  Widget custome_horizontal_7days(var height,var width,var context,snapshot,value){
    return Container(
      width: width*1,
      height: height*0.6,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context,index){
          return Row(
            children: 
              [
                SizedBox(width: 10,),
                Container(
                height: height*0.35,
                width: width*0.65,
                decoration: BoxDecoration(
                color: Color.fromARGB(15, 59, 58, 58).withOpacity(0.2),
                borderRadius: BorderRadius.circular(25)
                ),
              ),
              SizedBox(width: width*0.02,),
            ],
          );
        }
      ),
    );
  }
}