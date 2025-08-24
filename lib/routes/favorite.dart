import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Favorite Prints', style: TextStyle(fontSize: 32)),
        // backgroundColor: Color(0xff86c8f7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/elderflame.webp',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Elderflame Vandal',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('Uploaded by: Shuncey'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
