import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final Function dismiss;
  const WelcomeScreen({super.key, required this.dismiss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 150),
              child: Column(
                children: [
                  Text(
                    'PrintSpace',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text('Share your 3D Prints to the world.'),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextButton(
                  onPressed: () {
                    dismiss();
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Color(0xff86c8f7)),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Get Started',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
