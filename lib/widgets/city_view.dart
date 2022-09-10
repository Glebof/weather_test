import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';
import '../utilities/forecast_util.dart';

// Виджет отображения города и даты
class CityView extends StatelessWidget {

  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var city = snapshot.data?.city.name;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000);
    return Column(
      children: <Widget>[
        Text(
          '$city',
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28.0,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 4.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ],
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18.0,
            color: Colors.white,
            shadows: <Shadow>[
              Shadow(
                offset: Offset(0, 0),
                blurRadius: 4.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ],
          ),
        ),
      ],
    );
  }
}
