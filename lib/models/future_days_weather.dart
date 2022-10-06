import 'package:weather_lady2/models/weather_data.dart';

class DailyData {

  List<WeatherData>? list;

  DailyData(this.list);


  factory DailyData.fromJson (Map<String, dynamic> json) {
    WeatherData weather;
    List<WeatherData> secondList = [];
    String location_name = json['location']['name'];
    String location_country = json['location']['country'];
    List jsonList = json['forecast']['forecastday'];
    int index = 0;
    while(index < jsonList.length) {

      weather = WeatherData.days(
          temp_c: jsonList[index]['day']['avgtemp_c'],
          conditionText: jsonList[index]['day']['condition']['text'],
          conditionIcon: jsonList[index]['day']['condition']['icon'],
          humidity: jsonList[index]['day']['avghumidity'],
          locationCountry: location_country,
          locationName: location_name,
          time: jsonList[index]['date'],
          maxtemp_c: jsonList[index]['day']['maxtemp_c'],
          mintemp_c: jsonList[index]['day']['mintemp_c'],
          maxwind_kph: jsonList[index]['day']['maxwind_kph']
      );
      secondList.add(weather);
      index++;
    }
    return DailyData(secondList);



  }
}