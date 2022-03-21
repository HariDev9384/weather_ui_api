import 'package:flutter/material.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
class new_p extends StatefulWidget {
  String? city;
  new_p({Key? key}) : super(key: key);

  @override
  State<new_p> createState() => _new_pState();
}

class _new_pState extends State<new_p> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextField(
              onChanged: (val){
                setState(() {
                  widget.city=val;
                });
              },
            ),
            RaisedButton(
              onPressed: (){
                fetch_api_notifier(widget.city).get_weather();
              },
            )
          ],
        ),
      ),
    );
  }
}