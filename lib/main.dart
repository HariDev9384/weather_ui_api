import 'package:flutter/material.dart';
import 'package:weather_ui_api/provider/AppState.dart';
import 'package:weather_ui_api/provider/weather_provider.dart';
import 'package:weather_ui_api/screens/Home_Screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  //remove flash screen white
  FlutterNativeSplash.remove();
  runApp(
    //provider for intial state

    // multi provider for list of many change notifier
    MultiProvider(
    providers: [
      ChangeNotifierProvider<AppState>(create: (context)=>AppState()),
      ChangeNotifierProvider(create: ((context) => fetch_api_notifier())),
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