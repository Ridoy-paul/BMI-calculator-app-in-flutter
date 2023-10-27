import 'dart:math';
import 'constants/colors.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'widgets/age_weight_widget.dart';
import 'widgets/height_widget.dart';
import 'package:flutter/material.dart';
import 'widgets/gender_widget.dart';
import 'widgets/score_widget.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
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
  int _age = 0;
  int _weight = 0;
  bool _isFinished = false;
  double _bmiScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                AgeWeightWidget(
                  onAgeChange: (int age) {
                    _age = age;
                  },
                  onWeightChange: (int weight) {
                    _weight = weight;
                  },
                ),
                Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
                  shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: colorGray,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SwipeableButtonView(
                      onFinish: () {
                        setState(() {
                          if (_gender == 0 || _heightInCm == 0) {
                            _isFinished = false;
                            showSnackBar(
                                context,
                                _gender == 0
                                    ? "Please Select Gender"
                                    : "Please Set Height");
                          } else {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return ScoreWidget(
                                  bmiScore: _bmiScore,
                                  age: _age,
                                );
                              },
                            );
                            _isFinished = false;
                          }
                        });
                      },
                      onWaitingProcess: () {
                        calculateBMI();
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _isFinished = true;
                          });
                        });
                      },
                      isFinished: _isFinished,
                      activeColor: colorDeepOrange,
                      buttonWidget: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: colorBlack,
                      ),
                      buttonText: "C A L C U L A T E",
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBMI() {
    _bmiScore = _weight / pow(_heightInCm / 100, 2);
  }

  static void showSnackBar(BuildContext context, String mesage) {
    final snackBar = SnackBar(
      showCloseIcon: true,
      backgroundColor: colorBlack,
      closeIconColor: colorWhite,
      duration: const Duration(seconds: 2),
      content: Text(mesage, textAlign: TextAlign.center, style: TextStyle(color: colorWhite),),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 50,
        left: 10,
        right: 10,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // final snackBar = SnackBar(
    //   content: Text(mesage),
    //   duration: const Duration(seconds: 2),
    //   action: SnackBarAction(
    //     label: 'Dismiss',
    //     onPressed: () {},
    //   ),
    // );
    // ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
