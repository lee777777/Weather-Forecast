import 'package:flutter/material.dart';
import 'package:weather_lady2/services/current_weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context){

    data = data.isNotEmpty ? data :ModalRoute.of(context)?.settings.arguments as Map;
    String time =  data['time'].substring(11, data['time'].length - 1);
    int hoursTime = int.parse('08:44'.substring(0,time.length -1).replaceAll(':', ''));
    if(hoursTime <= 12){
      time = time+' AM';
    }else{
      time = time+' PM';
    }
    print('hours: $hoursTime');
    String date = data['time'].substring(0,10);
    print('time: $time, date: $date');


    print('data: $data');

    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/clouds2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[

                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('($date) $time Weather in ${data['locationName']} ',
                        style: TextStyle(
                          fontSize: 10.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),)
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(data['conditionText'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    ),),
                  SizedBox(height: 10.0),
                  Image.network('https:${data['conditionIcon']}'),
                  SizedBox(height: 10.0),
                  Text('Humidity: ${data['humidity']}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                    ),),
                ],
              ),
            ),
          )

    );
  }
}