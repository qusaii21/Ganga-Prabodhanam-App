import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeatherQualityInsidePage extends StatelessWidget {
  final String stationName;

  WeatherQualityInsidePage({required this.stationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        title: Text('$stationName - Water Quality'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              'Rainfall Monthly Runoff (mm)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 100),
                        FlSpot(1, 120),
                        FlSpot(2, 80),
                        FlSpot(3, 140),
                        FlSpot(4, 90),
                        FlSpot(5, 110),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                      ),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.withOpacity(0.4),
                            Colors.orange.withOpacity(0.2)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Annual Runoff',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 130),
                        FlSpot(1, 100),
                        FlSpot(2, 90),
                        FlSpot(3, 120),
                        FlSpot(4, 85),
                        FlSpot(5, 115),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                      ),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.withOpacity(0.4),
                            Colors.orange.withOpacity(0.2)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'River Watch Discharge',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 150),
                        FlSpot(1, 140),
                        FlSpot(2, 90),
                        FlSpot(3, 130),
                        FlSpot(4, 110),
                        FlSpot(5, 100),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [Colors.yellow, Colors.orange],
                      ),
                      barWidth: 2,
                      isStrokeCapRound: true,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            Colors.yellow.withOpacity(0.4),
                            Colors.orange.withOpacity(0.2)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Go Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
