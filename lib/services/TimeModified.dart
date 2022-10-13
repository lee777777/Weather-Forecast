List returnTime(String date){
  String time =  date.substring(11, date.length );
  List list = time.split(':');
  List listInt = [int.parse(list[0]), int.parse(list[0])];
  return  listInt;
}
String returnTimeString(String date){
  String time;
  List list = returnTime(date);
  int hoursTime = list[0];
  int minutsTime = list[1];
  if(hoursTime >= 0 && hoursTime <= 12 ){
    time = '$hoursTime:$minutsTime AM';

  }else {

    time = '${hoursTime-12}:$minutsTime PM';

  }
  return time;
}