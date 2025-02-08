import 'package:flutter/material.dart';
import 'package:flutter_application_time_api/pages/home.dart';
import 'package:flutter_application_time_api/pages/loading.dart';
import 'package:flutter_application_time_api/pages/choose_location.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/', // Start from Loading page always
      routes: {
        '/': (context) => Loading(), // Ensure loading page is initial
        '/home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
