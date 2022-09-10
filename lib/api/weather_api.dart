import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_forecast_daily.dart';
import '../utilities/constants.dart';
import 'package:weather/utilities/location.dart';

// Получаю прогноз погоды используя get-запрос
class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool? isCity}) async {

    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String>? parameters;

    // Запрос если город введен
    if(isCity == true){
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'q': cityName,
      };
      parameters = queryParameters.cast<String, String>();

    // Запрос если город не введен, т.е. по геолокации
    } else {
      var queryParameters = {
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      parameters = queryParameters;
    }

    // Полный url с данным запросом
    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}
