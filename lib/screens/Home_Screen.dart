import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class Home extends StatelessWidget {
  Future<weather_forcast>? future=fetch_api_notifier().get_weather();
  final GlobalKey _scaffoldkey=new GlobalKey();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Consumer<fetch_api_notifier>(
    builder: ((context, value, child) => GestureDetector(
      child: Scaffold(
        key: _scaffoldkey,
          drawer:Drawer(
            
            child: SafeArea(
              child: Column(
                children: [
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
          body: FutureBuilder<weather_forcast>(
            future: future,
            builder: ((context, snapshot) {
              if(snapshot.hasData){
                return SafeArea(
              child: Stack(
                children: [
                
                  Positioned(
                  bottom: 0,
                  top: 0,    
                    child: custom_appbar(height,width,snapshot,value,context)),
                  Positioned(
                    top: height/09.9,
                    bottom: height/1.67,
                    left: height/022,
                    child: custom_container(height,width,snapshot,value)),
                  Positioned(
                      top: height*0.4,
                      child: custome_horizontal_7days(height, width, context,snapshot,value)),
                    Positioned(
                      top: height*0.42,
                      left: height*0.155,
                    child: custom_text(height,snapshot,value))
                ],
              ),
            );
              }
              else if(snapshot.hasError){
                throw Exception('Network Failed');
              }
              return Center(child: CircularProgressIndicator(color: Colors.white,));
            }),
             
          ),
        ),
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

  Widget custom_appbar(var height,var width,snapshot,value,context){
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
                    Text(double.parse(snapshot.data!.main.temp.toString()).ceil().toString().substring(0,2),
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
                    Text('${snapshot.data!.name} ${snapshot.data!.sys.country}',
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