import 'package:flutter/material.dart';

class Custom_Text{
  var height;
  var width;
  var value;
  var snapshot;
  Custom_Text({required this.height,required this.width,required this.value,required this.snapshot});
  Widget custom_text( height,snapshot,value){
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
}