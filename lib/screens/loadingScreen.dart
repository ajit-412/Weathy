import 'package:flutter/material.dart';
import 'locationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathy/functions/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherDetails();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.redAccent,
          size: 150.0,
        ),
      ),
    );
  }
}

//*************************************************************************
//*************************************************************************
//*************************************************************************
//*************************************************************************
//*
//   Future getLoaction() async {
//     // Check if the location service is enabled
//     bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     print("Location service enabled: $serviceEnabled");
//     if (!serviceEnabled) {
//       return Future.error("Location service is not enabled.");
//     }
//     // Check if the location permission is granted
//     LocationPermission status = await Geolocator.checkPermission();
//     print("Location permission: $status");
//     if (status == LocationPermission.denied) {
//       // Request the location permission
//       status = await Geolocator.requestPermission();
//       if (status == LocationPermission.denied) {
//         // Permission is not granted, return an error message
//         return Future.error("Location permission not granted.");
//       }
//     }
//
// // Get the current position if the location permission is granted
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//
//     print(position);
//     return position;
//   }
