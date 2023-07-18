import 'package:flutter/material.dart';
import 'package:weathy/constants/constants.dart';
import 'package:weathy/functions/weather.dart';
import 'package:weathy/screens/cityScreen.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int? temperature;
  String? cityName;
  String? countryName;

  late String weatherIcon;
  late String weatherMessage;

  @override
  void initState() {
    super.initState();

    updateData(widget.locationWeather);
  }

  void updateData(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to fetch data';
        cityName = 'Null';
        return;
      }

      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      weatherMessage = weatherModel.getMessage(temperature!);

      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weatherModel.getWeatherIcon(condition);

      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/blue.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var wData = await weatherModel.getWeatherDetails();
                      updateData(wData);
                      print('data updated');
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var enteredCityName = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      print(enteredCityName);
                      if (enteredCityName != null) {
                        var weatherData = await weatherModel.getCityweather(
                            cityName: enteredCityName);
                        updateData(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  '$weatherMessage in $cityName(:',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
