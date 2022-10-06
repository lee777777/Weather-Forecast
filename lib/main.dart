
import 'package:flutter/material.dart';
import 'package:weather_lady2/pages/loading.dart';
import 'package:weather_lady2/pages/home.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    },
  ));
}
