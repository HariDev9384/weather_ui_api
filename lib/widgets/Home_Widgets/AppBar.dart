import 'package:flutter/material.dart';
class CustomAppBar{
  var height;
  var width;
  var snapshot;
  var context;
  var value;
  var appstate;
  CustomAppBar( {required this.height,required this.width,required this.context,required this.appstate,required this.snapshot,required this.value});
  Widget custom_appbar( height, width,snapshot,value,context,appstate){
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
                  Text('weather forcast',
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

}