import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalysisChart extends StatefulWidget {
  const AnalysisChart({Key? key}) : super(key: key);

  @override
  State<AnalysisChart> createState() => _AnalysisChartState();
}

class _AnalysisChartState extends State<AnalysisChart> {
  List<Color> gradientColors = [
    const Color(0xFF754182),
    const Color(0xFFdaa8e8),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 180,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
        ),
        child: LineChart(mainData()),
      ),
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineTouchData: const LineTouchData(enabled: false),
      minX: 0,
      maxX: 11,
      minY: 0.5,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 2),
            FlSpot(2.6, 1),
            FlSpot(4.9, 4),
            FlSpot(6.8, 2.1),
            FlSpot(8, 3),
            FlSpot(9.5, 2),
            FlSpot(11, 3),
          ],
          isCurved: true,
          gradient: LinearGradient(colors: gradientColors),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(show: false),
        ),
      ],
    );
  }
}
