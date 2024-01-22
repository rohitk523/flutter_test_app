import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class RandomPieChart extends StatelessWidget {
  RandomPieChart({super.key});
  final Random random = Random();

  List<PieChartSectionData> generateRandomData() {
    List<PieChartSectionData> data = [];

    for (int i = 0; i < 5; i++) {
      data.add(
        PieChartSectionData(
          value: random.nextDouble() * 100,
          title: '${(random.nextDouble() * 100).toStringAsFixed(2)}%',
          color: Color.fromARGB(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
          ),
          radius: 80,
        ),
      );
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
          sectionsSpace: 0,
          centerSpaceRadius: 0,
          sections: generateRandomData(),
        ),
      ),
    );
  }
}

class RandomBarGraph extends StatelessWidget {
  RandomBarGraph({super.key});
  final Random random = Random();

  List<BarChartGroupData> generateRandomData() {
    List<BarChartGroupData> data = [];

    for (int i = 0; i < 5; i++) {
      data.add(
        BarChartGroupData(
          x: i,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
                fromY: random.nextDouble() * 100,
                toY: 0, // Set the toY value to 0 for a simple bar chart
                color: Colors.amber),
          ],
        ),
      );
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: BarChart(
        BarChartData(
          barGroups: generateRandomData(),
        ),
      ),
    );
  }
}
