import 'package:flutter/material.dart';

import '../../models/get_icon.dart';

class hori_cont {
  var height;
  var width;
  var context;
  var snapshot;
  var value;
  hori_cont({
    required this.height,
    required this.width,
    required this.context,
    required this.snapshot,
    required this.value,
  });
  
    Widget custome_horizontal_7days( height, width, context,snapshot,value){
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
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      child: GetWeatherIcon(weatherDes: snapshot.data!.list[index].weather[0].main, color: Colors.white, size: 60),
                    ),
                    Text(snapshot.data.list[index].main.temp.toString()),
                  ],
                ),
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
