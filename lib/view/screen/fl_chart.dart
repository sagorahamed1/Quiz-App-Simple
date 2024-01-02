import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyFiChart extends StatelessWidget {
  const MyFiChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PieChart(
              swapAnimationDuration: Duration(seconds: 30),
              PieChartData(
                  sections: [
                    PieChartSectionData(
                        value: 200,
                        color: Colors.blue
                    ),
                    PieChartSectionData(
                        value: 20,
                        color: Colors.red
                    ),
                    PieChartSectionData(
                        value: 20,
                        color: Colors.green
                    ),
                    PieChartSectionData(
                        value: 20,
                        color: Colors.yellow
                    ),
                  ]
              )
          ),
        ],
      )
    );
  }
}
