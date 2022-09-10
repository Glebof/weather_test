import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';

// Виджет отображения текущей погоды, максимальной и минимальной температуры сегодня и описание
class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var temp = forecastList?[0].temp.day.toStringAsFixed(0);
    var tempMin = forecastList?[0].temp.min.toStringAsFixed(0);
    var tempMax = forecastList?[0].temp.max.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 15.0),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$temp°',
                style: const TextStyle(
                  fontSize: 80.0,
                  fontWeight: FontWeight.w200,
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
            ),
            Row(
              children: [
                Text(
                  'min.:$tempMin°,',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
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
                  'max.:$tempMax°',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
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
            ),
            const SizedBox(height: 5.0),
            Text(
              '$description',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
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
        ),
      ],
    );
  }
}
