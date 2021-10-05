import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tell_me/main.dart';
import 'package:tell_me/screens/home/Home.dart';
import 'package:tell_me/screens/splash_intro/constant.dart';
import 'package:tell_me/screens/splash_intro/introScreen.dart';

// int? isviewed;


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Start handling intro screen
  // void handelIntroScreen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   isviewed = prefs.getInt('onBoard');
  // }



  // End Handling Screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      Duration(seconds: 4),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) {
              return isviewed != 0 ? OnBoard() : Home();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: splashWidget());
  }

  Widget splashWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // logo here
          Image.asset(
            'assets/images/tell_me_logo_no background.png',
            height: MediaQuery.of(context).size.height / 4,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
          ),
          CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}
