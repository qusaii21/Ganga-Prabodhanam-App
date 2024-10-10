import 'package:flutter/material.dart';
import 'package:flutter_application_3/WaterQualityInsidePage.dart';

class WaterQualityPage extends StatelessWidget {
  final String stationName;

  WaterQualityPage({required this.stationName});

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
                'Water Quality',
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
                  'Water Temperature : 22°C',
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
                  'Turbidity : 5 NTU',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.yellow,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Water Quality Index (WQI)',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('80', style: TextStyle(color: Colors.white)),
                            Container(
                              width: 20,
                              height: 50,
                              color: Colors.white,
                            ),
                            Text('28/08/24', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('72', style: TextStyle(color: Colors.white)),
                            Container(
                              width: 20,
                              height: 40,
                              color: Colors.white,
                            ),
                            Text('29/08/24', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('76', style: TextStyle(color: Colors.white)),
                            Container(
                              width: 20,
                              height: 45,
                              color: Colors.yellow,
                            ),
                            Text('Today', style: TextStyle(color: Colors.yellow)),
                          ],
                        ),
                        Column(
                          children: [
                            Text('78', style: TextStyle(color: Colors.white)),
                            Container(
                              width: 20,
                              height: 48,
                              color: Colors.white,
                            ),
                            Text('31/08/24', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  // Navigate to the WaterQualityInsidePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WaterQualityInsidePage(stationName: '',)),
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


