// To parse this JSON data, do
//
//     final weatherData = weatherDataFromJson(jsonString);

import 'dart:convert';

WeatherData weatherDataFromJson(String str) => WeatherData.fromJson(json.decode(str));

String weatherDataToJson(WeatherData data) => json.encode(data.toJson());

class WeatherData {
  WeatherData({
    required this.request,
    required this.location,
    required this.current,
  });

  Request request;
  Location location;
  Current current;

  factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
    request: Request.fromJson(json["request"]),
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
  );

  Map<String, dynamic> toJson() => {
    "request": request.toJson(),
    "location": location.toJson(),
    "current": current.toJson(),
  };
}

class Current {
  Current({
   required this.observationTime,
   required this.temperature,
   required this.weatherCode,
   required this.weatherIcons,
   required this.weatherDescriptions,
   required this.windSpeed,
   required this.windDegree,
   required this.windDir,
   required this.pressure,
   required this.precip,
   required this.humidity,
   required this.cloudcover,
   required this.feelslike,
   required this.uvIndex,
   required this.visibility,
   required this.isDay,
  });

  String observationTime;
  int temperature;
  int weatherCode;
  List<String> weatherIcons;
  List<String> weatherDescriptions;
  int windSpeed;
  int windDegree;
  String windDir;
  int pressure;
  int precip;
  int humidity;
  int cloudcover;
  int feelslike;
  int uvIndex;
  int visibility;
  String isDay;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    observationTime: json["observation_time"],
    temperature: json["temperature"],
    weatherCode: json["weather_code"],
    weatherIcons: List<String>.from(json["weather_icons"].map((x) => x)),
    weatherDescriptions: List<String>.from(json["weather_descriptions"].map((x) => x)),
    windSpeed: json["wind_speed"],
    windDegree: json["wind_degree"],
    windDir: json["wind_dir"],
    pressure: json["pressure"],
    precip: json["precip"],
    humidity: json["humidity"],
    cloudcover: json["cloudcover"],
    feelslike: json["feelslike"],
    uvIndex: json["uv_index"],
    visibility: json["visibility"],
    isDay: json["is_day"],
  );

  Map<String, dynamic> toJson() => {
    "observation_time": observationTime,
    "temperature": temperature,
    "weather_code": weatherCode,
    "weather_icons": List<dynamic>.from(weatherIcons.map((x) => x)),
    "weather_descriptions": List<dynamic>.from(weatherDescriptions.map((x) => x)),
    "wind_speed": windSpeed,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure": pressure,
    "precip": precip,
    "humidity": humidity,
    "cloudcover": cloudcover,
    "feelslike": feelslike,
    "uv_index": uvIndex,
    "visibility": visibility,
    "is_day": isDay,
  };
}

class Location {
  Location({
   required this.name,
   required this.country,
   required this.region,
   required this.lat,
   required this.lon,
   required this.timezoneId,
   required this.localtime,
   required this.localtimeEpoch,
   required this.utcOffset,
  });

  String name;
  String country;
  String region;
  String lat;
  String lon;
  String timezoneId;
  String localtime;
  int localtimeEpoch;
  String utcOffset;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    country: json["country"],
    region: json["region"],
    lat: json["lat"],
    lon: json["lon"],
    timezoneId: json["timezone_id"],
    localtime: json["localtime"],
    localtimeEpoch: json["localtime_epoch"],
    utcOffset: json["utc_offset"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "region": region,
    "lat": lat,
    "lon": lon,
    "timezone_id": timezoneId,
    "localtime": localtime,
    "localtime_epoch": localtimeEpoch,
    "utc_offset": utcOffset,
  };
}

class Request {
  Request({
    required this.type,
    required this.query,
    required this.language,
    required this.unit,
  });

  String type;
  String query;
  String language;
  String unit;

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    type: json["type"],
    query: json["query"],
    language: json["language"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "query": query,
    "language": language,
    "unit": unit,
  };
}
