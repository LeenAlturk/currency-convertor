import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:currency_converter_app/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 10000,
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                  "https://lottie.host/74014ecb-21b8-4070-a0b3-c92b4fe4a687/TqNz9NZbUG.json"),
               SizedBox(height: 12,),
              SizedBox(
                width: 300.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.purple,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    totalRepeatCount: 2,
                    animatedTexts: [
                      FadeAnimatedText('convert!'),
                      FadeAnimatedText('convert currency!!'),
                      FadeAnimatedText('convert currency RIGHT NOW!!!'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),



            ],
          ),
        ),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: double.infinity,
        backgroundColor: Colors.white);
  }
}
