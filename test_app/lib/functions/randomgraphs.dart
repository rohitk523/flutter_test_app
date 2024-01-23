import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math';

class RandomPieChart extends StatelessWidget {
  final Random random = Random();

  RandomPieChart({super.key});
  Map<String, double> generateRandomData() {
    Map<String, double> data = {};

    final socialMList = ['Instagram', 'X', 'Reddit', 'Meta', 'YouTube'];

    for (int i = 0; i < 5; i++) {
      double randomValue = random.nextDouble() * 100;
      data[socialMList[i]] = randomValue;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PieChart(
          dataMap: generateRandomData(),
          chartRadius: MediaQuery.of(context).size.width / 2,
          chartType: ChartType.disc,
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
          ),
        ),
      ],
    );
  }
}

class ProgressBarsForLabels extends StatelessWidget {
  final Random random = Random();

  ProgressBarsForLabels({super.key});
  Map<String, double> generateRandomData() {
    Map<String, double> data = {};

    final socialMList = ['Instagram', 'X', 'Reddit', 'Meta', 'YouTube'];

    for (int i = 0; i < 5; i++) {
      double randomValue = random.nextDouble() * 100;
      data[socialMList[i]] = randomValue;
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final randomData = generateRandomData();
    return SizedBox(
      height: 400,
      child: ListView.builder(
        itemCount: randomData.length,
        itemBuilder: (context, index) {
          String label = randomData.keys.toList()[index];
          int progress = randomData[label]!.round();

          return Column(
            children: [
              ListTile(
                title: Text(label),
                subtitle: LinearProgressIndicator(
                  value: progress.toDouble(),
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _getColor(index), // Use the same color as the pie chart
                  ),
                ),
              ),
              Text('$progress')
            ],
          );
        },
      ),
    );
  }

  Color _getColor(int index) {
    // You can customize the color logic based on the index or other conditions
    // In this example, we use a simple switch statement
    switch (index) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      case 3:
        return Colors.red;
      case 4:
        return Colors.purple;
      default:
        return Colors.blue;
    }
  }
}
