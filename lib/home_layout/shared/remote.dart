
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/home_layout/models/weather_model.dart';

class WeatherData{

  Future<WeatherModel> getData(var latitude , var longitude)async{
       var getUri = Uri.parse('http://api.weatherapi.com/v1/current.json?key=70f624c17abf4c149da151927221208&q=$latitude,$longitude&aqi=no');
      var response = await http.get(getUri);
     var body = jsonDecode(response.body);
      return WeatherModel.fromJson(body);
  }
}
