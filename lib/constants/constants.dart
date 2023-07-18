import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Nunito',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 30.0,
  fontFamily: 'Nunito',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kCityTextField = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city_rounded,
    color: Colors.black,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    borderSide: BorderSide.none,
  ),
);
