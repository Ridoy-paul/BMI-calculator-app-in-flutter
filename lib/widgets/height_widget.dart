import 'package:flutter/material.dart';

class HeightWidget extends StatefulWidget {
  const HeightWidget({super.key});

  @override
  State<HeightWidget> createState() => _HeightWidgetState();
}

class _HeightWidgetState extends State<HeightWidget> {
  int _height = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        elevation: 12,
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
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _height.toString(),
                            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _height.toString(),
                            style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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


            ],
          ),
        ),
      ),
    );
  }
}
