import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: pBackgroundColor,
        primaryColor: pPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: pTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}