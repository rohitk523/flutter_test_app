import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math';

class RandomPieChartWithProgressBars extends StatelessWidget {
  final Random random = Random();

  RandomPieChartWithProgressBars({super.key});

  Map<String, double> generateRandomData() {
    Map<String, double> data = {};

    final socialMList = [
      'Instagram',
      'X(Twitter)',
      'Reddit',
      'Meta',
      'YouTube'
    ];

    // Ensure that the total percentage is 100
    double totalPercentage = 0;

    for (int i = 0; i < 4; i++) {
      double randomValue = random.nextDouble() * (100 - totalPercentage);
      totalPercentage += randomValue;
      data[socialMList[i]] = randomValue;
    }

    // Set the last item to make the total 100
    data[socialMList[4]] = 100 - totalPercentage;

    return data;
  }

  @override
  Widget build(BuildContext context) {
    final randomData = generateRandomData();

    return SizedBox(
      height: 800,
      child: ListView.builder(
        itemCount: randomData.length + 1, // +1 for the pie chart
        itemBuilder: (context, index) {
          if (index == 0) {
            // Render the pie chart
            return PieChart(
              dataMap: randomData,
              chartRadius: MediaQuery.of(context).size.width / 2,
              chartType: ChartType.disc,
              chartValuesOptions: const ChartValuesOptions(
                showChartValueBackground: true,
              ),
            );
          } else {
            // Render the progress bars
            String label = randomData.keys.toList()[index - 1];
            int progress = randomData[label]!.round();
            double value = progress / 100.0;

            // Calculate the value in minutes
            int minutes = (value * 60).round();

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  ListTile(
                    title: Text(
                      label,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    subtitle: LinearProgressIndicator(
                      value: value,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getColor(index - 1),
                      ),
                    ),
                    trailing: Text(
                      '$progress%',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      '$minutes min',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 10),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Color _getColor(int index) {
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
