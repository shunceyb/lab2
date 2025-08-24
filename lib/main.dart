import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:print_space/routes/favorite.dart';
import 'package:print_space/routes/home.dart';
import 'package:print_space/routes/profile.dart';
import 'package:print_space/routes/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentRoute = 0;
  bool welcomeDismissed = false;

  var routes = [HomeScreen(), FavoriteScreen(), ProfileScreen()];

  dismiss() {
    setState(() {
      welcomeDismissed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Print Space',
      home: !welcomeDismissed
          ? WelcomeScreen(dismiss: dismiss)
          : Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                items: [
                  Icon(Icons.home, color: Colors.white),
                  Icon(Icons.star, color: Colors.white),
                  Icon(Icons.person, color: Colors.white),
                ],
                onTap: (index) => setState(() => currentRoute = index),
                animationDuration: Duration(milliseconds: 250),
                // backgroundColor: Color(0xff86c8f7),
                backgroundColor: Colors.white,
                color: Color(0xff063d6b),
              ),
              body: routes[currentRoute],
            ),
    );
  }
}
