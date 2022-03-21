import 'package:flutter/material.dart';
import 'package:weather_ui_api/models/weather.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
import 'package:weather_ui_api/screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:weather_ui_api/screens/location_Screen.dart';
import 'package:weather_ui_api/screens/text.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  FlutterNativeSplash.remove();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=>fetch_api_notifier())
    ],
    child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}