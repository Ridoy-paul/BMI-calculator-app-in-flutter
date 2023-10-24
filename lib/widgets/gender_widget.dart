import '../constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  final Function(int) onGenderChange;
  const GenderWidget({super.key, required this.onGenderChange});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  int _gender = 0;
  final ChoiceChip3DStyle selectedStyle = const ChoiceChip3DStyle(
      backColor: colorGreen,
      topColor: colorWhite,
      borderRadius: BorderRadius.all(Radius.circular(30))
  );

  final ChoiceChip3DStyle unSelectedStyle = const ChoiceChip3DStyle(
      backColor: colorWhite,
      topColor: colorWhite,
      borderRadius: BorderRadius.all(Radius.circular(30))
  );


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip3D(
            style: _gender == 1 ? selectedStyle : unSelectedStyle,
            border: Border.all(color: _gender == 1 ? colorGreen : colorGray),
            height: MediaQuery.sizeOf(context).width * 0.36,
            width: MediaQuery.sizeOf(context).width * 0.32,
            onSelected: () {
              setState(() {
                _gender = 1;
              });
              widget.onGenderChange(_gender);
            },
            onUnSelected: () {},
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
            style: _gender == 2 ? selectedStyle : unSelectedStyle,
            border: Border.all(color: _gender == 2 ? colorGreen : colorGray),
            height: MediaQuery.sizeOf(context).width * 0.36,
            width: MediaQuery.sizeOf(context).width * 0.32,
            onSelected: () {
              setState(() {
                _gender = 2;
              });
              widget.onGenderChange(_gender);
            },
            onUnSelected: () {},
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
