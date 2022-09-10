import 'package:flutter/material.dart';
import 'city_search_screen.dart';
import '../api/weather_api.dart';
import '../models/weather_forecast_daily.dart';
import '../widgets/bottom_list_view.dart';
import '../widgets/city_view.dart';
import '../widgets/detail_view.dart';
import '../widgets/temp_view.dart';

// Главный экран приложения
class WeatherForecastScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;

  const WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('Weather'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              var tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const CitySearchScreen();
              }));
              if (tappedName != null) {
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/809468.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: <Widget>[
            FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: <Widget>[
                      const SizedBox(height: 40.0),
                      CityView(snapshot: snapshot),
                      const SizedBox(height: 40.0),
                      TempView(snapshot: snapshot),
                      const SizedBox(height: 40.0),
                      DetailView(snapshot: snapshot),
                      const SizedBox(height: 40.0),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
