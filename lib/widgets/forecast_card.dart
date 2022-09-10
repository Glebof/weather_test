import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../utilities/forecast_util.dart';

// Виджет отображения погоды на каждый день недели на ближайшие 7 дней
// с описанием в виде иконки, минимальной и максимальной температурой
Widget forecastCard(AsyncSnapshot snapshot, int index) {
  var forecastList = snapshot.data.list;
  var dayOfWeek = '';
  var today = DateFormat('EEE').format(DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt * 1000));
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(',')[0] == today ? 'Today' : fullDate.split(',')[0];

  var tempMin = forecastList[index].temp.min.toStringAsFixed(0);
  var tempMax = forecastList[index].temp.max.toStringAsFixed(0);
  var icon = forecastList[index].getIconUrl();

  return Row(
    children: [
      Container(
        width: 70,
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          '$dayOfWeek',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
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
      Expanded(child: SizedBox()),
      Image.network(icon, scale: 1.2),
      Expanded(child: SizedBox()),
      Container(
        alignment: Alignment.center,
        width: 34,
        child: Text(
          '$tempMin°',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
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
      SizedBox(
        width: 5,
      ),
      Container(
        height: 5,
        width: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0.5, color: Colors.black),
            gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Colors.orange,
                Colors.blue,
              ],
            )),
      ),
      SizedBox(
        width: 10,
      ),
      Container(
        alignment: Alignment.center,
        width: 34,
        child: Text(
          '$tempMax°',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
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
    ],
  );
}
