

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';


const apiKey = '2ac6ab52b82b5c9c54b478d27ad52c61';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;
  @override
  void initState() {
    super.initState();
    geoLocationData();
  }

  void geoLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;
    
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData  = await networkHelper.getData();

    
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}
