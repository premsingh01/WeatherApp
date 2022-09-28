import 'package:geolocator/geolocator.dart'as geo;
import 'package:get/get.dart';
import 'package:weatherapp/api/repository/weather_repo.dart';
import 'package:weatherapp/model/weather_model.dart';
import 'package:geocoding/geocoding.dart' as geo_code;

class GlobalController extends GetxController {
  //create various variables
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  WeatherData? _weatherData;

  //instance for them to be called
  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;
  WeatherData? getWeatherData()=> _weatherData;


@override
  void onInit(){

     if(_isLoading.isTrue){
       getLocation();
     }
     super.onInit();
    }

    getLocation() async {

     bool isServiceEnabled;
     geo.LocationPermission locationPermission;

     isServiceEnabled = await geo.Geolocator.isLocationServiceEnabled();

     //return if service is enabled
     if(!isServiceEnabled) {
      return Future.error('Location Not Enabled');
     }

     //status of permission
      locationPermission = await geo.Geolocator.checkPermission();

     if(locationPermission == geo.LocationPermission.deniedForever) {
       return Future.error('Location Permission Are Denied Forever');
     }
     else if(locationPermission == geo.LocationPermission.denied) {

       //request Permission
       locationPermission = await geo.Geolocator.requestPermission();
       if(locationPermission == geo.LocationPermission.denied) {
         return Future.error('Location Permission Denied');
       }

     }

     return await geo.Geolocator.getCurrentPosition(
       desiredAccuracy:  geo.LocationAccuracy.high)
         .then((value) async {
           //updating the latitude and longitude
       _latitude.value = value.latitude;
       _longitude.value = value.longitude;
       await callApi();  //calling api
       _isLoading.value =false;
     });


    }

    Future<void> callApi() async {
  WeatherRepo weatherRepo = WeatherRepo();
  _weatherData = await weatherRepo.getWeatherData(geo_code.Location(latitude: _latitude.value,longitude: _longitude.value,timestamp: DateTime.now()));
  }
  }