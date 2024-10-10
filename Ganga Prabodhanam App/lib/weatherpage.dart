import 'package:flutter/material.dart';
import 'package:flutter_application_3/WeatherInsidePage.dart';

class Weather extends StatelessWidget {
  final String stationName;

  Weather({required this.stationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width * 0.8,
          
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Weather',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Temperature : 22°C',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  'Wind : 5 m/s',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(height: 20),
              
             
              TextButton(
                onPressed: () {
                  // Navigate to the WaterQualityInsidePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WeatherQualityInsidePage(stationName: '',)),
                  );
                },
                child: Text(
                  'view more',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
