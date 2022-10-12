import 'package:flutter/material.dart';
import 'package:weather_lady2/models/weather_data.dart';
import 'package:weather_lady2/services/current_weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:weather_lady2/services/TimeModified.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context){

    data = data.isNotEmpty ? data :ModalRoute.of(context)?.settings.arguments as Map;
    List timeList = returnTime(data['time']);
    int hoursTime = int.parse(timeList[0]);
   int minutsTime = int.parse(timeList[1]);
    String time = '';
    int hoursPM = hoursTime -12;

    List futureHours = data['hours'];

    // for(int i =0; i <= futureHours.length; i++ ) {
    //
    //   if(futureHours.contains(int.parse(futureHours[i].time.substring(11, data['time'].length ).split(':')[0]) <= hoursTime)){
    //     futureHours.removeAt(futureHours[i]);
    //   }
    // }
    // print(futureHours.toString());


    // List? removedHoursIndex ;
    // for(int i =0; i <= futureHours.length; i++ ) {
    //   removedHoursIndex?.add( futureHours.indexWhere((hours) => (int.parse(hours[i].time.split(':')[0]) <= hoursTime)));
    //   if(removedHoursIndex != null) {
    //     futureHours2.removeAt(removedHoursIndex[i]);
    //   //  print(futureHours);
    //   }
    // }
    print('future first hour temp: ${futureHours[hoursTime+1].temp_c}');//,  second hour temp: ${futureHours[1].temp_c}
   // print('future2 first hour temp: ${futureHours2[0].temp_c},  second2 hour temp: ${futureHours2[1].temp_c}');
    List? hourlyList = [];
    for(int i = hoursTime+1; i <= 23; i++ ) {
      print(futureHours[i].time);
     hourlyList.add(futureHours[i]) ;
    }
    print("temp first hour: ${hourlyList[0].temp_c}");

   // print(removedHoursIndex);
    String bgImage = '';
    if( data['is_day'] == 1){
      if(data['cloud'] == 0){
        bgImage = 'sea.jpg';
      }else{
        bgImage = 'cloudy_day.jpg';
      }
    }else {
      if(data['cloud'] == 0){
        bgImage = 'clear_night.jpg';
      }else{
        bgImage = 'cloudy_night.jpg';
      }
    }
    if(hoursTime >= 0 && hoursTime <= 12 ){
      time = '$hoursTime:$minutsTime AM';

    }else {

      time = '$hoursPM:$minutsTime PM';

    }
    print('hours: $hoursTime');
  //  print('minuts: $minutsTime');
    String date = data['time'].substring(0,10);
    print('time: $time, date: $date');


    print('data: $data  ${data['locationCountry']}');

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/$bgImage"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Padding(
              padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
              child: Column(
                children: <Widget>[

                  Image.network('https:${data['conditionIcon']}'
                      , height: 100
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18
                      ),
                      Text('($date) $time, in ${data['locationName']}, ${data['locationCountry']} ',
                        style: TextStyle(
                          fontSize: 9.0, //8
                          letterSpacing: 1.7,
                          color: Colors.white,
                            fontStyle: FontStyle.italic
                        ),)
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('${data['temp_c'].round()}°C',
                        style: TextStyle(
                          fontSize: 49.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),),

                    ],
                  ),
                  SizedBox(height: 12.0),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                  Text(data['conditionText'],
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic
                    ),),
                 ],
                ),
                  SizedBox(height: 20.0),
              Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                  Text('Humidity: ${data['humidity']},',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),),
                  Text('  Wind: ${data['wind_kph']} kgh ${data['wind_dir']}',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),),
               ],
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                  Text('Pressure: ${data['pressure_mb']} mb,',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),),
                  Text('  Feels like: ${data['feelslike_c'].round()}°C',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),),
               ],
                ),
                  SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
            child: Row(

                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 50.0,
                      width: 50.0,
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: hourlyList.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Container(
                             // padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                            height: 50,
                            width: 100,
                            color: Colors.amber,
                            child: Center(child: Text("weather: ${hourlyList[index].conditionText}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ))));
                        },
                      ),
                    ),
                  ),


                  ]
                ),
          ),
              ]
            ),
          )

    ));


    // ListView(
    //   scrollDirection: Axis.horizontal,
    //   children: futureHours.map((hours){
    //     return Container(
    //         color: Colors.orangeAccent,
    //         height: 100, width:150,
    //         alignment: Alignment.center,
    //         child: Text('${hours.temp_c}')
    //     );
    //   }).toList(),
    // )
  }
}