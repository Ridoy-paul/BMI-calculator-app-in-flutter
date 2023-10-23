import '../constants/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            style: ChoiceChip3DStyle(
              backColor: _gender == 1 ? colorGreen : colorWhite,
              topColor: colorWhite,
              borderRadius: const BorderRadius.all(Radius.circular(30))
            ),
            border: Border.all(color: _gender == 1 ? colorGreen : colorGray),
            height: MediaQuery.sizeOf(context).width * 0.36,
            width: MediaQuery.sizeOf(context).width * 0.32,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
            },
            onUnSelected: () {
              print("male not selected");
            },
            selected: _gender == 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'asset/images/profile-man.png',
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * 0.21,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Male", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),)
                ],
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ChoiceChip3D(
            style: ChoiceChip3DStyle(
                backColor: _gender == 2 ? colorGreen : colorWhite,
                topColor: colorWhite,
                borderRadius: const BorderRadius.all(Radius.circular(30))
            ),
            border: Border.all(color: _gender == 2 ? colorGreen : colorGray),
            height: MediaQuery.sizeOf(context).width * 0.36,
            width: MediaQuery.sizeOf(context).width * 0.32,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
            },
            onUnSelected: () {
              print("male not selected");
            },
            selected: _gender == 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                    'asset/images/woman.png',
                    alignment: Alignment.center,
                    width: MediaQuery.sizeOf(context).width * 0.21,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  const Text("Female", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),)
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}
