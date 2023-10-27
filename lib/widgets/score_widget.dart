import '../constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ScoreWidget extends StatefulWidget {
  final double bmiScore;
  final int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  ScoreWidget({super.key, required this.bmiScore, required this.age,});

  @override
  State<ScoreWidget> createState() => _ScoreWidgetState();
}

class _ScoreWidgetState extends State<ScoreWidget> {
  @override
  Widget build(BuildContext context) {
    setBmiInterpretation();
    return Container(
      width: double.infinity,
      color: Colors.white,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your Score",
            style: TextStyle(
              fontSize: 30,
              color: colorBlack,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
            valueWidget: Text(
              widget.bmiScore.toStringAsFixed(1),
              style: const TextStyle(fontSize: 40),
            ),
            currentValue: widget.bmiScore.toDouble(),
            needleColor: Colors.blue,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.bmiStatus!,
            style: const TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            widget.bmiInterpretation!,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Close"),
          )
        ],
      ),
    );
  }

  void setBmiInterpretation() {
    if (widget.bmiScore > 30) {
      widget.bmiStatus = 'Obese';
      widget.bmiInterpretation = "Please work to reduce obesity";
      widget.bmiStatusColor = Colors.pink;
    } else if (widget.bmiScore >= 25) {
      widget.bmiStatus = 'OverWeight';
      widget.bmiInterpretation = "Do Regular Exercise & reduce the weight";
      widget.bmiStatusColor = Colors.deepOrange;
    } else if (widget.bmiScore >= 18.5) {
      widget.bmiStatus = 'Normal';
      widget.bmiInterpretation = "Enjoy, You are fit!";
      widget.bmiStatusColor = Colors.green;
    } else if (widget.bmiScore < 18.5) {
      widget.bmiStatus = 'UnderWeight';
      widget.bmiInterpretation = "Try to increase the weight!";
      widget.bmiStatusColor = Colors.red;
    }
  }
}
