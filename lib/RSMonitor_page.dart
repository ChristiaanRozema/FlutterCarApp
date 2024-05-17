import 'package:flutter/material.dart';

class RSMonitorPage extends StatefulWidget {
  @override
  _RSMonitorPageState createState() => _RSMonitorPageState();
}

class _RSMonitorPageState extends State<RSMonitorPage> {
  bool isSportModeActivated = false;
  bool isNurburgringModeActivated = false;

  // Dummy data for top speed graph
  List<double> topSpeedData = [140, 160, 155, 170, 165, 180, 175, 190];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RS Monitor'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isSportModeActivated
                ? [Colors.yellow, Colors.black]
                : isNurburgringModeActivated
                    ? [Colors.red, Colors.black]
                    : [Colors.blue, Colors.black],
          ),
        ),
        child: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Fuel Consumption:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Top Speed:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                // Display top speed graph
                Container(
                  width: 300,
                  height: 200,
                  child: Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LineChart(
                        data: topSpeedData,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Turbo Pressure:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Tire Pressure:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'G-Force:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                Text(
                  'Passenger Count:',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSportModeActivated = !isSportModeActivated;
                      isNurburgringModeActivated = false;
                    });
                  },
                  child: Text(
                    'Sport Mode',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSportModeActivated ? Colors.yellow : Colors.grey,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isNurburgringModeActivated = !isNurburgringModeActivated;
                      isSportModeActivated = false;
                    });
                  },
                  child: Text(
                    'Nürburgring Mode',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        isNurburgringModeActivated ? Colors.red : Colors.grey,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/nurburgrung.png',
                  width: 200,
                ),
                SizedBox(height: 30), // Adjusted height to avoid overflow
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineChart extends StatelessWidget {
  final List<double> data;

  LineChart({required this.data});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(300, 200),
      painter: LineChartPainter(data: data),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> data;

  LineChartPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color.fromARGB(255, 255, 251, 0)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double width = size.width;
    double height = size.height;
    double columnWidth = width / (data.length - 1);

    Path path = Path();
    path.moveTo(0, height);

    for (int i = 0; i < data.length; i++) {
      double x = i * columnWidth;
      double y = height - data[i] * height / 200;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

