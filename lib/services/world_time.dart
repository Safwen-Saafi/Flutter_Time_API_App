import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WorldTime {
  String location;
  late String time; // the time in that location, we're gonna define it later
  String flag;
  String url;
  late bool isDaytime;
  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String? apiKey = dotenv.env['API_KEY'];
      String apiUrl =
          'http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=zone&zone=$url';
      Response response = await get(Uri.parse(apiUrl));
      Map data = jsonDecode(response
          .body); // jsonDecode() takes a JSON-encoded string and converts it into a Dart object
      String datetime = data['formatted'];
      DateTime now = DateTime.parse(datetime);
      print(now.hour);
      isDaytime = (now.hour >= 7 && now.hour <= 16) ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Error: $e');
      time = 'Could not fetch time';
    }
  }
}
