import 'package:flutter/material.dart';
import 'package:flutter_application_time_api/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    try {
      WorldTime instance = WorldTime(
          location: 'Berlin', flag: 'germany.png', url: 'Africa/Cairo');
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time
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
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text('loading'),
      ),
    );
  }
}
