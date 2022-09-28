import 'dart:convert';

import 'package:geocoding/geocoding.dart' as geo;
import 'package:weatherapp/api/api_client.dart';
import 'package:weatherapp/model/weather_model.dart';

class WeatherRepo{
  Future<WeatherData> getWeatherData(geo.Location location) async {
    try {
      var response = await ApiClient().client.get(Uri.parse('http://api.weatherstack.com/current?access_key=${ApiClient().key}&query=${location.latitude},${location.longitude}&units=m'));
      if(response.statusCode==200){
        return weatherDataFromJson(response.body);
      } else{
        return Future.error(response.body);
      }
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
