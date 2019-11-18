import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> 
with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async{
    // bool seen = await getIsSeen() ?? false;
    // bool isLogin = await getIsLogin() ?? false;
    // if(seen==true){
    //   if(isLogin==true){
    //     Navigator.of(context).pushReplacementNamed('/home');
    //   }else{
    //     Navigator.of(context).pushReplacementNamed('/login');
    //   }
    
    // }else{
    //   Navigator.of(context).pushReplacementNamed('/onboarding');
    // }
    Navigator.of(context).pushReplacementNamed('/onboarding');
    
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/logo/logo_germas.png',
                width: animation.value * 150,
                height: animation.value * 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}