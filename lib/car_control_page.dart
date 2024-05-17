import 'package:flutter/material.dart';

class CarControlPage extends StatefulWidget {
  @override
  _CarControlPageState createState() => _CarControlPageState();
}

class _CarControlPageState extends State<CarControlPage> {
  int climateMode = 0; // 0: Uit, 1: Laag, 2: Hoog
  int heatedSeatsMode = 0; // 0: Uit, 1: Laag, 2: Gemiddeld, 3: Hoog
  double temperature = 20.0; // Standaardtemperatuur

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyRenault Control'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/Renault_Captur.jpg',
                width: 325,
              ),
              Text(
                'My Renault Captur',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/carInfo');
                },
                child: Text('Bekijk auto-informatie'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Knopkleur instellen op geel
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/serviceHistory');
                },
                child: Text('Bekijk servicegeschiedenis'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // Knopkleur instellen op geel
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Klimaatregeling',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ToggleButtons(
                children: <Widget>[
                  Text('Uit'),
                  Text('Laag'),
                  Text('Hoog'),
                ],
                isSelected: [climateMode == 0, climateMode == 1, climateMode == 2],
                onPressed: (int index) {
                  setState(() {
                    climateMode = index;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Verwarmde stoelen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ToggleButtons(
                children: <Widget>[
                  Text('Uit'),
                  Text('Laag'),
                  Text('Gemiddeld'),
                  Text('Hoog'),
                ],
                isSelected: [heatedSeatsMode == 0, heatedSeatsMode == 1, heatedSeatsMode == 2, heatedSeatsMode == 3],
                onPressed: (int index) {
                  setState(() {
                    heatedSeatsMode = index;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Temperatuur: ${temperature.toStringAsFixed(1)}°C',
                style: TextStyle(fontSize: 20),
              ),
              Slider(
                value: temperature,
                min: 16.0,
                max: 30.0,
                divisions: 14,
                onChanged: (value) {
                  setState(() {
                    temperature = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Bediening',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Informatie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Geschiedenis',
          ),      
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Klimaat',
          ),
        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white, // Instellen van de kleur van het niet-geselecteerde pictogram op wit
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/carControl');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/carInfo');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/serviceHistory');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/climate');
          }
        },
      ),
    );
  }
}
