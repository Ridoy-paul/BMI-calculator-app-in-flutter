import '../constants/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key});

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ChoiceChip3D(
            style: const ChoiceChip3DStyle(
              backColor: colorWhite,
              topColor: colorWhite,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            border: Border.all(color: colorGray),
            height: MediaQuery.sizeOf(context).width * 0.36,
            width: MediaQuery.sizeOf(context).width * 0.3,
            onSelected: () {
              print("male selected");
            },
            onUnSelected: () {
              print("male not selected");
            },
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

        ],
      ),
    );
  }
}
