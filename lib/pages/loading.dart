import 'package:flutter/material.dart';
import 'package:flutter_application_time_api/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime( location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime
      });
    } catch (e) {
      print('Error fetching time: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
            ),
          ),
    );
  }
}
