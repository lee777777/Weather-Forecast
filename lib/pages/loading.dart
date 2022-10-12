import 'package:flutter/material.dart';
import 'package:weather_lady2/models/future_days_weather.dart';
import 'package:weather_lady2/services/current_weather_api.dart';
import 'package:weather_lady2/models/weather_data.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_lady2/models/location_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_lady2/services/daiy_forecast_api.dart';

import '../models/hourly_weather.dart';
import '../services/forecast_api.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading> {

  Future<Position> getLocation() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
  }
  void setupWeatherData() async {
    Position pos = await getLocation();
    WeatherData futureCurrentWeather;
    HourlyData weatherHours;
    DailyData weathrDays;
   LocationString loc = LocationString(lat:  pos.latitude, lon: pos.longitude);
    //fetchForecastData(loc);
    futureCurrentWeather = await fetchData(loc);
    weatherHours = await fetchForecastData(loc);
    weathrDays = await fetchDailyForecastData(loc);
    print('lat&lon: ${loc.locationString}');
    Navigator.pushNamed(context, '/home', arguments: {
      'lat': loc.lat,
      'lon': loc.lon,
      'temp_c': futureCurrentWeather.temp_c,
      'feelslike_c': futureCurrentWeather.feelslike_c,
      'conditionText': futureCurrentWeather.conditionText,
      'conditionIcon': futureCurrentWeather.conditionIcon,
      'wind_kph': futureCurrentWeather.wind_kph,
      'wind_dir': futureCurrentWeather.wind_dir,
      'pressure_mb': futureCurrentWeather.pressure_mb,
      'humidity': futureCurrentWeather.humidity,
      'cloud': futureCurrentWeather.cloud,
      'is_day': futureCurrentWeather.is_day,
      'locationName': futureCurrentWeather.locationName,
      'time': futureCurrentWeather.time,
      'locationCountry': futureCurrentWeather.locationCountry,
      'hours': weatherHours.list
    });


  }

  @override
  void initState() {
    super.initState();
    setupWeatherData();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.blue,
      body:
      Center(
        child: SpinKitSpinningLines(
          color: Colors.white,
          size: 120.0,
        ),

      ),
    );
  }
}