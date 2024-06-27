import 'package:flutter/material.dart';
import 'database_service.dart';
import 'addservice_screen.dart';

class ServiceHistoryPage extends StatefulWidget {
  @override
  _ServiceHistoryPageState createState() => _ServiceHistoryPageState();
}

class _ServiceHistoryPageState extends State<ServiceHistoryPage> {
  List<Map<String, dynamic>> serviceHistory = [];

  @override
  void initState() {
    super.initState();
    _fetchServiceHistory();
  }

  Future<void> _fetchServiceHistory() async {
    DatabaseService dbService = DatabaseService();
    List<Map<String, dynamic>> data = await dbService.fetchData();
    setState(() {
      serviceHistory = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service History'),
      ),
      body: serviceHistory.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: serviceHistory.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    serviceHistory[index]['date'] ?? '',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 5),
                      Text(
                        'Service Type: ${serviceHistory[index]['type'] ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Service Details: ${serviceHistory[index]['details'] ?? ''}',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                );
              },
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddServiceScreen(context);
        },
        tooltip: 'Add Service',
        child: Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddServiceScreen(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddServiceScreen()),
    );

    if (result != null) {
      setState(() {
        serviceHistory.add(result);
      });
    }
  }
}

class AddServiceScreen extends StatefulWidget {
  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a service type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _detailsController,
                decoration: InputDecoration(labelText: 'Details'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter service details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(
                      context,
                      {
                        'date': _dateController.text,
                        'type': _typeController.text,
                        'details': _detailsController.text,
                      },
                    );
                  }
                },
                child: Text('Add Service'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    _typeController.dispose();
    _detailsController.dispose();
    super.dispose();
  }
}
