import 'package:flutter/material.dart';

class Custom_Search {
  var height;
  var width;
  var value;
  var snapshot;
  var context;
  var fetchstate;
  var appstate;
  Custom_Search({
    required this.height,
    required this.width,
    required this.value,
    required this.snapshot,
    required this.context,
    required this.fetchstate,
    required this.appstate,
  });
    Widget custom_search(height,width,snapshot,value,context,appstate,fetchstate){
    return TextField(
      onSubmitted: (val){
        if(val.isNotEmpty){
          appstate.gettext(val);
        }else
        if(val.isEmpty){
          appstate.defaultloc();
        }
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
}
