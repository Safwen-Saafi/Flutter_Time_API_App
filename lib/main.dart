import 'package:flutter/material.dart';
import 'package:flutter_application_time_api/pages/home.dart';
import 'package:flutter_application_time_api/pages/loading.dart';
import 'package:flutter_application_time_api/pages/choose_location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
