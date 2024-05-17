import 'package:flutter/material.dart';
import 'service_history_page.dart';
import 'car_control_page.dart';
import 'car_climate_Page.dart';
import 'car_info_page.dart';
import 'RSMonitor_page.dart';

void main() {
  runApp(RenaultApp());
}

class RenaultApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myRenault',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        backgroundColor: Colors.yellow,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => RenaultHomePage(),
        '/carControl': (context) => CarControlPage(),
        '/carInfo': (context) => CarInfoPage(),
        '/serviceHistory': (context) => ServiceHistoryPage(),
        '/rsMonitor': (context) => RSMonitorPage(),
        '/climate': (context) => Climate(),
      },
    );
  }
}

class RenaultHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('myRenault'),
        backgroundColor: Colors.black, // Set navigation bar color
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/renault_logo.jpg',
                width: 1000,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to myRenault!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/carControl');
                },
                child: Text('Control Car'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.car_rental),
            label: 'Control',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor),
            label: 'RS Monitor',
          ),
        ],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white, // Set unselected icon color to white
        backgroundColor: Colors.black, // Set background color of bottom navigation bar
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/carControl');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/carInfo');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/serviceHistory');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/rsMonitor');
          } 
        },
      ),
    );
  }
}