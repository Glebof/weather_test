import 'package:flutter/material.dart';

import '../models/weather_forecast_daily.dart';
import 'forecast_card.dart';

// Виджет отображения заголовка и ListView с погодой на неделю
class BottomListView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const BottomListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '7-day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
              fontSize: 15.0,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(0, 0),
                  blurRadius: 4.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                )
              ],
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Color(0x44999999),
            ),
            child: Container(
              height: MediaQuery.of(context).size.height /3.7,
              // height: 210,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.black87, height: 1),
                itemCount: snapshot.data!.list!.length,
                itemBuilder: (context, index) => Container(
                  child: forecastCard(snapshot, index),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
