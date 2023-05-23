import 'package:beerapis/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Application name

      // Application theme data, you can set the colors for the application as
      // you want

      // A widget which will be started on application startup
      home: HomePage(),
    );
  }
}
