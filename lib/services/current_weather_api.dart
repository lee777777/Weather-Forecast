import 'package:http/http.dart' as http;
import 'package:weather_lady2/models/weather_data.dart';
import 'dart:convert';
import 'package:weather_lady2/models/location_data.dart';


   Future<WeatherData> fetchData( LocationString loc) async {
     // if (loc.city =='' && (loc.lat ==0 && loc.lon == 0)){
     //   //error no location is located
     // }else {
       WeatherData result;
       final response = await http
           .get(Uri.parse(
           'http://api.weatherapi.com/v1/current.json?key=5cfaeac162474604bf9181011222909&q=${loc
               .locationString}'));

       if (response.statusCode == 200) {
         // If the server did return a 200 OK response,
         // then parse the JSON.
         print('current weather:  ${response.body}');
         print('temp: ${jsonDecode(response.body)['current']['temp_c']}');

         result = WeatherData.fromJson(jsonDecode(response.body));
         print('result: ${result.conditionText}');
         return result;
       } else {
         // If the server did not return a 200 OK response,
         // then throw an exception.
         throw Exception('Failed to load weather data');
       }
     //}
  }
