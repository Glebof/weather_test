import 'package:flutter/material.dart';
import 'package:weather/screens/location_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(

      // Отображаю главный экран WeatherForecastScreen через LocationScreen для отображения погоды по текущей геолокации
      home: LocationScreen(),
    );
  }
}
