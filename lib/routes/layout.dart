import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:print_space/routes/favorite.dart';
import 'package:print_space/routes/home.dart';

import 'package:print_space/routes/profile.dart';
import 'package:print_space/routes/store.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int currentRoute = 0;
  var routes = [
    HomeScreen(),
    StoreScreen(), // Store page at index 1
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Icon(
              Icons.home,
              color: currentRoute == 0 ? Color(0xff7c4dff) : Color(0xff333333),
              size: currentRoute == 0 ? 32 : 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Icon(
              Icons.store,
              color: currentRoute == 1 ? Color(0xff7c4dff) : Color(0xff333333),
              size: currentRoute == 1 ? 32 : 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Icon(
              Icons.star,
              color: currentRoute == 2 ? Color(0xff7c4dff) : Color(0xff333333),
              size: currentRoute == 2 ? 32 : 28,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Icon(
              Icons.person,
              color: currentRoute == 3 ? Color(0xff7c4dff) : Color(0xff333333),
              size: currentRoute == 3 ? 32 : 28,
            ),
          ),
        ],
        onTap: (index) => setState(() => currentRoute = index),
        animationDuration: const Duration(milliseconds: 250),
        backgroundColor: Colors.white,
        color: Color(0xffb39ddb), // distinct color for the curve
        buttonBackgroundColor: Color(0xffede7f6),
        height: 62,
        index: currentRoute,
      ),
      body: routes[currentRoute],
    );
  }
}
