import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget GetWeatherIcon({required var weatherDes,required var color,required double size}){

  switch(weatherDes){
    case 'Clear':
      {return Icon(FontAwesomeIcons.sun,color: Colors.amberAccent,size: size,);}
      break;
    case 'Clouds':
      {
return Icon(FontAwesomeIcons.cloud,color: Colors.blueGrey,size: size,);
}
      break;
    case 'Rain':
      {return Icon(FontAwesomeIcons.cloudRain,color: Colors.lightBlueAccent[100],size: size,);}
      break;
    case 'Snow':
      {return Icon(FontAwesomeIcons.snowman,color: color,size: size,);}
      break;
    default:
      {return Icon(FontAwesomeIcons.sun,color: color,size: size,);}
  }

}