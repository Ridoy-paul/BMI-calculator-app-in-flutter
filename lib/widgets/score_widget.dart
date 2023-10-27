import '../constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreWidget extends StatefulWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;
  ScoreWidget({super.key, required this.bmiScore, required this.age});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Your Score", style: TextStyle(fontSize: 30, color: colorBlack, fontWeight: FontWeight.w500),),
          const SizedBox(height: 10,),
          PrettyGauge(
            gaugeSize: 300,
            minValue: 0,
            maxValue: 40,
            segments: [
              GaugeSegment('UnderWeight', 18.5, colorRed),
              GaugeSegment('Normal', 6.4, colorGreen),
              GaugeSegment('OverWeight', 5, colorDeepOrange),
              GaugeSegment('Obese', 10.1, colorPink),
            ],
            valueWidget: Text(widget.bmiScore.toStringAsFixed(1), style: const TextStyle(fontSize: 40),),
            currentValue: widget.bmiScore.toDouble(),
            needleColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
