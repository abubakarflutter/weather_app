import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = 'bbce2e98367db5eefd04da76c32d3f5a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitide;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

 void getLocationData() async {
      Location location = Location();
      await location.getCurrentLocation();

      latitide = location.latitude;
      longitude = location.longitude;

      NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitide&lon=$longitude&appid=$apiKey');

      var weatherData = await networkHelper.getData();

 }



     // double temperature = jsonDecode(data)['main']['temp'];
     // String cityName = jsonDecode(data)['name'];
     // int conditionNumber = jsonDecode(data)['weather'][0]['id'];





  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
