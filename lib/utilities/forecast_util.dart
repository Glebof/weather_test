import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  // Метод для форматирования даты
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, d MMM').format(dateTime);
  }

  // Метод для форматирования деталей о погоде (давления, осадков, ветра)
  static getItem(IconData iconData, int value, String units) {
    return Column(
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
          size: 28.0,
          shadows: <Shadow>[
            Shadow(
              offset: Offset(0, 0),
              blurRadius: 4.0,
              color: Color.fromARGB(255, 0, 0, 0),
            )
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              '$value',
              style: const TextStyle(
                fontSize: 20.0,
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
            const SizedBox(width: 5.0),
            Text(
              units,
              style: const TextStyle(
                fontSize: 15.0,
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
