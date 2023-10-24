import 'package:bmi_calculator_app_in_flutter/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class AgeWeightWidget extends StatefulWidget {
  final Function(int) onAgeChange;
  final Function(int) onWeightChange;

  const AgeWeightWidget({Key? key, required this.onAgeChange, required this.onWeightChange}) : super(key: key);

  @override
  State<AgeWeightWidget> createState() => _AgeWeightWidgetState();
}

class _AgeWeightWidgetState extends State<AgeWeightWidget> {
  int _age = 1;
  int _weight = 1;

  final RoundedRectangleBorder cardBorderStyle = const RoundedRectangleBorder(
    side: BorderSide(color: colorGray),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: cardBorderStyle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Age", style: TextStyle(fontWeight: FontWeight.bold),),
                    NumberPicker(
                      itemHeight: 30,
                      value: _age,
                      minValue: 0,
                      maxValue: 150,
                      //step: 1,
                      haptics: true,
                      onChanged: (int value) {
                        setState(() {
                          _age = value;
                        });
                        widget.onAgeChange(_age);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20,),
            Card(
              elevation: 4,
              shape: cardBorderStyle,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text("Weight(kg)", style: TextStyle(fontWeight: FontWeight.bold),),
                    NumberPicker(
                      itemHeight: 30,
                      value: _weight,
                      minValue: 0,
                      maxValue: 150,
                      //step: 1,
                      haptics: true,
                      onChanged: (int value) {
                        setState(() {
                          _weight = value;
                        });
                        widget.onWeightChange(_weight);
                      },
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
