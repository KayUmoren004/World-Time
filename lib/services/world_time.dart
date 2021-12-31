import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String? location;
  String? time;
  String? flag;
  String? url;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      var link = Uri.parse("http://worldtimeapi.org/api/timezone/$url");

      //Make request
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      //print(data);

      //Get properties from data
      String datetime = data["datetime"];
      // print({datetime, offset});

      //Create DateTime object
      DateTime now = DateTime.parse(datetime.substring(0, 26));

      //Set time prop
      time = DateFormat.jm().format(now);

      //Set isDayTime prop
      // isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print({'err': e});
      time = "Could not get time data";
    }
  }
}
