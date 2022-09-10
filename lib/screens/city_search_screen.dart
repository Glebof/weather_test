import 'package:flutter/material.dart';

// Экран для получения погоды по введенному городу
class CitySearchScreen extends StatefulWidget {
  const CitySearchScreen({Key? key}) : super(key: key);

  @override
  _CitySearchScreenState createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends State<CitySearchScreen> {
  late String cityName;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text('City search'),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/809468.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: Colors.white24),
                      filled: true,
                      fillColor: Colors.black54,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          borderSide: BorderSide.none),
                    ),
                    validator: (value) => value == '' ? 'Field is required' : null,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                TextButton(
                  child: const Text(
                    'Get Weather',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )
                      ],
                    ),
                  ),
                  onPressed: () {
                    if (_formkey.currentState != null) {
                      if (_formkey.currentState!.validate()) {
                        Navigator.pop(context, cityName);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
