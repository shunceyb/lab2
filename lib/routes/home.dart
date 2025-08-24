import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Discover Prints', style: TextStyle(fontSize: 32)),
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
                      'assets/images/benchy.webp',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '3D Benchy',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('Uploaded by: Someone'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/pi-mount.webp',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pi Mount',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('Uploaded by: My Neighbor'),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/opener.webp',
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Bottle Opener',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('Uploaded by: I\'m not even sure'),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/images/lgx-mount.webp',
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'LGX Lite Mount',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text('Uploaded by: I have no idea'),
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
