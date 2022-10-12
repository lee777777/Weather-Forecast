List returnTime(String date){
  String time =  date.substring(11, date.length );
  return  time.split(':');
}