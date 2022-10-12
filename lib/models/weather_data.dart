
class WeatherData {
   double? temp_c;
   double? feelslike_c;
   String? conditionText;
   String? conditionIcon;
   double? wind_kph;
   String? wind_dir;
   double? pressure_mb;
   double? humidity;
   int? cloud;
   int? is_day;
   String? locationName;
   String? locationCountry;
   String? time;
   double? maxtemp_c;
   double? mintemp_c;
   double? maxwind_kph;


  WeatherData({ required this.temp_c, required this.feelslike_c, required this.conditionText,
    required this.conditionIcon, required this.wind_kph, required this.wind_dir,
    required this.pressure_mb, required this.humidity, required this.cloud, required this.is_day,
    required this.locationCountry, required this.locationName, required this.time} );


   WeatherData.days(
   {this.temp_c,
      this.conditionText,
      this.conditionIcon,
      this.humidity,
      this.locationName,
      this.locationCountry,
      this.time,
      this.maxtemp_c,
      this.mintemp_c,
      this.maxwind_kph});


  WeatherData.empty(){
    this.temp_c = 0;
    this.conditionText = '';
    this.conditionIcon ='';
    this.humidity= 0;
    this.locationName='';
    this.locationCountry='';
    this.time='';
    this.maxtemp_c= 0;
    this.mintemp_c= 0;
    this.maxwind_kph= 0;
  }

  factory WeatherData.fromJson (Map<String, dynamic> json) {
    return WeatherData(
        temp_c: json['current']['temp_c'],
        feelslike_c: json['current']['feelslike_c'],
        conditionText: json['current']['condition']['text'],
        conditionIcon: json['current']['condition']['icon'],
        wind_kph: json['current']['wind_kph'],
        wind_dir: json['current']['wind_dir'],
        pressure_mb: json['current']['pressure_mb'],
        humidity: json['current']['humidity'].toDouble(),
        cloud: json['current']['cloud'],
        is_day: json['current']['is_day'],
        locationCountry: json['location']['country'],
        locationName: json['location']['name'],
        time: json['location']['localtime']

    );
  }
}
