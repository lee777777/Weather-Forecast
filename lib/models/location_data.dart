

class LocationString {
  double lat = 0;
  double lon = 0;
  String city ='';
  String locationString = '';

  LocationString({required this.lat, required this.lon}){
    locationString = '${lat.toString()},${lon.toString()}';
  }
  LocationString.city({required this.city}){
    locationString = city;

  }
}