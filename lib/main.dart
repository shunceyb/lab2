import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:print_space/routes/favorite.dart';
import 'package:print_space/routes/home.dart';
import 'package:print_space/routes/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(showOnboarding: prefs.getBool('ON_BOARDING') ?? true));
}

class MyApp extends StatefulWidget {
  final bool showOnboarding;
  const MyApp({super.key, required this.showOnboarding});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentRoute = 0;
  bool showOnboardingScreen = false;

  @override
  void initState() {
    showOnboardingScreen = widget.showOnboarding;
    super.initState();
  }

  var routes = [HomeScreen(), FavoriteScreen(), ProfileScreen()];

  Future<void> dismiss() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);
    setState(() {
      showOnboardingScreen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Print Space',
      home: showOnboardingScreen
          ? Scaffold(
              appBar: AppBar(centerTitle: true, title: Text('Welcome')),
              body: IntroductionScreen(
                pages: [
                  PageViewModel(
                    image: Image.asset('assets/images/1.png'),
                    title: 'Share Your 3D Prints',
                    body:
                        'Showcase your creations with the community and get inspired by others.',
                    footer: SizedBox(
                      height: 45,
                      width: 150,
                      // child: ElevatedButton(
                      //   onPressed: () {},
                      //   child: Text("Next"),
                      // ),
                    ),
                  ),
                  PageViewModel(
                    image: Image.asset('assets/images/2.png'),
                    title: 'Follow Creators',
                    body:
                        'Stay updated with your favorite designers and see their latest prints.',
                    footer: SizedBox(
                      height: 45,
                      width: 150,
                      // child: ElevatedButton(
                      //   onPressed: () {},
                      //   child: Text("Next"),
                      // ),
                    ),
                  ),
                  PageViewModel(
                    image: Image.asset('assets/images/3.png'),
                    title: 'Explore Collections',
                    body:
                        'Discover trending models, tutorials, and curated collections.',
                    footer: SizedBox(
                      height: 45,
                      width: 150,
                      // child: ElevatedButton(
                      //   onPressed: () {},
                      //   child: Text("Next"),
                      // ),
                    ),
                  ),
                  PageViewModel(
                    image: Image.asset('assets/images/4.png'),
                    title: 'Comment & Collaborate',
                    body:
                        'Give feedback, ask questions, and collaborate with fellow makers.',
                    footer: SizedBox(
                      height: 45,
                      width: 150,
                      // child: ElevatedButton(
                      //   onPressed: () {},
                      //   child: Text("Next"),
                      // ),
                    ),
                  ),
                  PageViewModel(
                    image: Image.asset('assets/images/5.png'),
                    title: 'Download & Print',
                    body:
                        'Access print-ready files shared by the community and bring designs to life.',
                    footer: SizedBox(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          dismiss();
                        },
                        child: Text("Start Printing!"),
                      ),
                    ),
                  ),
                ],
                showDoneButton: true,
                showBackButton: true,
                showSkipButton: true,
                done: Text('Done'),
                skip: Text('Skip'),
                back: Text('Back'),
                next: Text('Next'),
                onDone: () => dismiss(),
                onSkip: () => dismiss(),
              ),
            )
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
