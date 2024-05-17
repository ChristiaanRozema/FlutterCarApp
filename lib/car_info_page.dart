import 'package:flutter/material.dart';

class CarInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Car Information'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Car Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CarInfoItem(
                icon: Icons.directions_car,
                label: 'Model',
                value: 'Renault Captur',
              ),
              CarInfoItem(
                icon: Icons.confirmation_number,
                label: 'Mileage',
                value: '50,000 km',
              ),
              CarInfoItem(
                icon: Icons.local_gas_station,
                label: 'Fuel Level',
                value: '70%',
              ),
              CarInfoItem(
                icon: Icons.info,
                label: 'VIN',
                value: 'XXXXXXXXXXXXXXXXX',
              ),
              CarInfoItem(
                icon: Icons.car_rental_outlined,
                label: 'Licenseplate',
                value: 'G-111-BB',
              ),
              CarInfoItem(
                icon: Icons.date_range,
                label: 'Registration Date',
                value: '01/01/2020',
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
        ],
        selectedItemColor: Colors.yellow,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/carControl');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/carInfo');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/serviceHistory');
          }
        },
      ),
    );
  }
}

class CarInfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const CarInfoItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(
          icon,
          size: 36,
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
          ],
        ),
      ],
    );
  }
}

