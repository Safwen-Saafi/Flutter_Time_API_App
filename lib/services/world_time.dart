import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  late String time; // the time in that location, we're gonna define it later
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      String apiKey = '3TALL5QNGX6J';
      String apiUrl =
          'http://api.timezonedb.com/v2.1/get-time-zone?key=$apiKey&format=json&by=zone&zone=$url';
      // make the request
      Response response = await get(Uri.parse(apiUrl));
      Map data = jsonDecode(response
          .body); // jsonDecode() takes a JSON-encoded string and converts it into a Dart object
      // get properties from json
      String datetime = data['formatted'];
      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      // set the time property
      time = DateFormat.jm().format(now);
      print(time);
    } catch (e) {
      print('Error: $e');
      time = 'Could not fetch time';
    }
  }
}

// Uri.parse(url) converts the string url into a Uri object.
// You can then easily access the individual components like scheme, host, path, etc., from the Uri.
