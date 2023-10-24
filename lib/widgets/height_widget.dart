import 'package:bmi_calculator_app_in_flutter/constants/colors.dart';
import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  final Function(int) onHeightChange;
  const HeightWidget({super.key, required this.onHeightChange});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _heightInCM = 0;
  double _heightInFeet = 0;
  double _sliderValue = 0;

  final RoundedRectangleBorder rectangleBorderStyle = const RoundedRectangleBorder(
      side: BorderSide(
        color: colorGray,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20))
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 13,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Height",
                style: TextStyle(fontSize: 25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: Card(
                      elevation: 7,
                      shape: rectangleBorderStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _heightInCM.toString(),
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            " cm",
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    width: MediaQuery.sizeOf(context).width * 0.4,
                    child: Card(
                      elevation: 7,
                      shape: rectangleBorderStyle,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _heightInFeet.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            " feet",
                            style: TextStyle(fontSize: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
              Slider(
                min: 0,
                max: 350,
                thumbColor: colorDeepOrange,
                value: _sliderValue.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                    _heightInCM = value.toInt();
                    _heightInFeet = _heightInCM / 30.48;
                  });
                },
              )

            ],
          ),
        ),
      ),
    );
  }
}
