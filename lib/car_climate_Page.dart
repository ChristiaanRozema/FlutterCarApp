import 'package:flutter/material.dart';

class Climate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 136, 127, 0),
              Colors.black,
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/carControl');
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Climate",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 6,
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.sunny,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Add your climate control buttons here
            SizedBox(height: 30),
            // Add your sleek circular slider here
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "AC is off",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Currently 0°C",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    activeTrackColor: Color.fromARGB(255, 194, 158, 0),
                    activeColor: const Color.fromARGB(255, 5, 5, 5),
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
