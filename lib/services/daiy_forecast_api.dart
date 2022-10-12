import 'package:http/http.dart' as http;
import 'package:weather_lady2/models/future_days_weather.dart';
import 'package:weather_lady2/models/weather_data.dart';
import 'dart:convert';
import 'package:weather_lady2/models/location_data.dart';

import '../models/hourly_weather.dart';


Future<DailyData> fetchDailyForecastData( LocationString loc) async {
  // if (loc.city =='' && (loc.lat ==0 && loc.lon == 0)){
  //   //error no location is located
  // }else {
  DailyData result;
  final response = await http
      .get(Uri.parse(
      'http://api.weatherapi.com/v1/forecast.json?key=5cfaeac162474604bf9181011222909&q=${loc
          .locationString}&days=14'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('Daily forecast weather:  ${response.body}');
    // print('temp: ${jsonDecode(response.body)['current']['temp_c']}');
    //
    print('forecast of first day condition: ${jsonDecode(response.body)['forecast']['forecastday'][0]['day']['condition']['text']}');
    result = DailyData.fromJson(jsonDecode(response.body));
    print('result of forecast day temp for second day: ${result.list![1].maxtemp_c}, date: ${result.list![1].time}');
    return result;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load weather data');
  }
  //}
}
