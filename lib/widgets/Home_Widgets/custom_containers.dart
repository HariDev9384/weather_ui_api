import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_ui_api/models/get_icon.dart';

class CustomContainer {
  var height;
  var width;
  var snapshot;
  var value;
  CustomContainer({
    required this.height,
    required this.width,
    required this.snapshot,
    required this.value,
  });
  Widget custom_container(height, width,snapshot,value){
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(double.parse(snapshot.data.list[0].main.temp).ceil().toString(),
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
                    ),
                    CircleAvatar(
                      maxRadius: 40,
                      child: GetWeatherIcon(weatherDes: snapshot.data!.list[0].weather[0].main, color: Colors.white, size: 60),
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
                    Text(snapshot.data!.city.name,
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
}
