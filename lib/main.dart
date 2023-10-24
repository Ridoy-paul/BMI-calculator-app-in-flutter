import 'package:bmi_calculator_app_in_flutter/constants/colors.dart';

import 'widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/gender_widget.dart';

void main() => runApp(BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _gender = 0;
  int _heightInCm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: colorWhite,
      //   title: const Text("BMI Calculator"),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                GenderWidget(
                  onGenderChange: (int gender) {
                    _gender = gender;
                  },
                ),
                HeightWidget(
                  onHeightChange: (int height) {
                    _heightInCm = height;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

