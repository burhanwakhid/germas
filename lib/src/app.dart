import 'package:flutter/material.dart';
import 'package:germas/src/onboarding/onboarding.dart';
import 'package:germas/src/pages/home/home.dart';
import 'package:germas/src/pages/landing_page/landing_page.dart';
import 'package:germas/src/splashscreen/splashscreen.dart';

class App extends StatelessWidget {
  final Map<String, WidgetBuilder> routes = {
    '/home': (context) => Home(),
    '/onboarding': (context) => IntroThreePage(),
    '/landing': (context) => LandingPage()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Germas',
      theme: ThemeData(
        primaryColor: const Color(0xFF01579B),
        accentColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: Splashscreen(),
    );
    
  }
}