import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: 32)),
        // backgroundColor: Color(0xff86c8f7),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 20,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.width * .15,
                      // borderRadius: BorderRadiusGeometry.circular(144),
                      foregroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Shuncey', style: TextStyle(fontSize: 24)),
                          Text('I-BIT KMUTNB'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Text('I print useless stuff'),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '67',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Following'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Followers'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '1',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Favorited'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Prints'),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    Image.asset(
                      'assets/images/elderflame.webp',
                      // width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/flash.webp',
                      // width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/vase.webp',
                      // width: MediaQuery.of(context).size.width * 0.45,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
