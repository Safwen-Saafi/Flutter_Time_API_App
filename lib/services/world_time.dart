import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time; // the time in that location, we're gonna define it later
  String flag;
  String url;
  late bool isDaytime;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String apiKey = '3TALL5QNGX6J';
      String apiUrl = 'http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=zone&zone=$url';
      Response response = await get(Uri.parse(apiUrl));
      Map data = jsonDecode(response.body); // jsonDecode() takes a JSON-encoded string and converts it into a Dart object
      String datetime = data['formatted'];
      DateTime now = DateTime.parse(datetime);
      isDaytime = now.hour > 6 && now.hour < 13 ? true : false;
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print('Error: $e');
      time = 'Could not fetch time';
    }
  }
}
