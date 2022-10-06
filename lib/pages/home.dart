import 'package:flutter/material.dart';
import 'package:weather_lady2/services/current_weather_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context){

    data = data.isNotEmpty ? data :ModalRoute.of(context)?.settings.arguments as Map;
    print('data: $data');

    return Scaffold(

      body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: <Widget>[

                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('weather',
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.blue,
                        ),)
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(data['conditionText'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.blue,
                    ),),
                  SizedBox(height: 10.0),
                  Image.network('https:${data['conditionIcon']}'),
                  SizedBox(height: 10.0),
                  Text('Humidity: ${data['humidity']}',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue,
                    ),),
                ],
              ),
            ),
          )
      ),
    );
  }
}