import 'package:weather_lady2/models/weather_data.dart';
import 'package:weather_lady2/services/TimeModified.dart';
class HourlyData {

  List<WeatherData>? list;
  String? location_time;
  HourlyData(this.list, this.location_time);
  HourlyData.noFutureHours(this.location_time);

  factory HourlyData.fromJson (Map<String, dynamic> json) {

    WeatherData weather;
    List<WeatherData> secondList = [];
       String location_name = json['location']['name'];
       String location_country = json['location']['country'];
        String localTime = json['location']['localtime'];



       List jsonList = json['forecast']['forecastday'][0]['hour'];
       int index = 0;

            while(index < jsonList.length ) {
              if(returnTime(jsonList[index]['time'])[0] <=
                  returnTime(localTime)[0]){
                weather = WeatherData(
                    temp_c: 0,
                    feelslike_c: 0,
                    conditionText: '',
                    conditionIcon: '',
                    wind_kph: 0,
                    wind_dir: '',
                    pressure_mb: 0,
                    humidity: 0,
                    cloud: 0,
                    is_day: 0,
                    locationCountry: '',
                    locationName: '',
                    time: jsonList[index]['time']
                );
                secondList.add(weather);
                index++;
              }else {
                weather = WeatherData(
                    temp_c: jsonList[index]['temp_c'],
                    feelslike_c: jsonList[index]['feelslike_c'],
                    conditionText: jsonList[index]['condition']['text'],
                    conditionIcon: jsonList[index]['condition']['icon'],
                    wind_kph: jsonList[index]['wind_kph'],
                    wind_dir: jsonList[index]['wind_dir'],
                    pressure_mb: jsonList[index]['pressure_mb'],
                    humidity: jsonList[index]['humidity'].toDouble(),
                    cloud: jsonList[index]['cloud'],
                    is_day: jsonList[index]['is_day'],
                    locationCountry: location_country,
                    locationName: location_name,
                    time: jsonList[index]['time']
                );
                secondList.add(weather);
                index++;

                // if (int.parse(returnTime(jsonList[index]['time'])[0]) == 0) {
                //   secondList.add(WeatherData.empty());
                //   return HourlyData(secondList, localTime);
                // }
              }
            }
    return HourlyData(secondList, localTime);


  }
}